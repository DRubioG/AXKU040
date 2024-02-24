//wm8731中寄存器的配置程序
 module reg_config(clock_50m,i2c_sclk,i2c_sdat,reset_n);
 input clock_50m;
 input reset_n;
 output i2c_sclk;
 inout i2c_sdat;
    
reg clock_20k;
reg [15:0]clock_20k_cnt;
reg [1:0]config_step;
reg [3:0]reg_index;
reg [23:0]i2c_data;
reg [15:0]reg_data;
reg start;
    
i2c_com u1(.clock_i2c(clock_20k),
           .reset_n(reset_n),
           //.ack(ack),
           .i2c_data(i2c_data),
           .start(start),
           .tr_end(tr_end),
           .i2c_sclk(i2c_sclk),
           .i2c_sdat(i2c_sdat));
					
//产生i2c控制时钟-20khz  
always@(posedge clock_50m or negedge reset_n)   
begin
   if(!reset_n) begin
      clock_20k<=0;
      clock_20k_cnt<=0;
   end
   else if(clock_20k_cnt<1249)
      clock_20k_cnt<=clock_20k_cnt+1;
   else begin
      clock_20k<=!clock_20k;
      clock_20k_cnt<=0;
   end
end
    
//寄存器IIC配置过程控制	 
always@(posedge clock_20k or negedge reset_n)    
begin
   if(!reset_n) begin
       config_step<=0;
       start<=0;
       reg_index<=0;
   end
   else begin
     if(reg_index<2) begin
        case(config_step)
        0:begin
            i2c_data<={8'hc2,reg_data};           //IIC Device address is 0xc2
            start<=1;                             //开始IIC数据传输
            config_step<=1;
        end
        1:begin
           if(tr_end) begin                           //IIC发送结束
               if(1'b1)                            //如果接收到IIC的应答信号
                  config_step<=2;
               else
                 config_step<=0;
               start<=0;
           end
        end
        2:begin
           reg_index<=reg_index+1;            //配置下一个寄存器
           config_step<=0;
        end
        endcase
      end
   end
end

			
//register of lp873220	
always@(reg_index)   
begin
        case(reg_index)
			  0:reg_data<=16'h06fc;       //BUCK0_VSET(addr=0x06), b2=1.8V, d4 =2.5V, fc=3.3V.
			  1:reg_data<=16'h07fc;       //BUCK1_VSET(addr=0x07), b2=1.8V, d4 =2.5V, fc=3.3V
      default:reg_data<=16'hffff;
      endcase
end
endmodule

