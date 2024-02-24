//*************************************************************************\
//Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd,All rights reserved
//
//                   File Name  :  uart_test.v
//                Project Name  :  
//                      Author  :  lhj
//                       
//                     Company  :  ALINX(shanghai) Technology Co.,Ltd
//                         WEB  :  http://www.alinx.cn/
//==========================================================================
//   Description:  uart test model 
//
//
//==========================================================================
//  Revision History:
//	Date		  By			Revision	Change Description
//--------------------------------------------------------------------------
//  2018/01/23     meisq		    1.0			Original
//*************************************************************************/
module uart_send(
	input      clk,
	input      rst_n,
	input      sign,//符号
	input[19:0] read_bcd_Temp,//十进制的温度数据
	input      uart_rx,//串口接收
	output     uart_tx	//串口发送
);

parameter CLK_FRE = 50;//Mhz

localparam IDLE =  0;
localparam SEND =  1; //send "time is..."
localparam WAIT =  2; //wait 1 second and send uart received data
reg[7:0] tx_data;    
reg[7:0] tx_str0;//发送的字符
reg[7:0] tx_str1;//发送的字符
reg tx_data_valid;//数据发送有效
wire tx_data_ready;//数据准备发送
reg[5:0] tx_cnt;//发送bit计数
wire[7:0] rx_data;//接收数据
wire rx_data_valid;//接收数据有效
wire rx_data_ready;//准备接收数据

reg[3:0] state;//状态
reg[31:0] wait_cnt;//等待时间计数器
parameter Dly_wait = 28'd50000000;  //1s
assign rx_data_ready = 1'b1;//Always ready to receive uart data 

always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)        //initial setting up
	begin
		wait_cnt <= 32'd0;
		tx_data <= 8'd0;
		state <= IDLE;
		tx_cnt <= 5'd0;
		tx_data_valid <= 1'b0;
	end
	else
	case(state)
		IDLE:
			state <= SEND;
		SEND:
		begin
			wait_cnt <= 32'd0;
			if(sign)//温度符号
			tx_data <= tx_str1;//负数
			else tx_data <= tx_str0;//正数
			
			if(tx_data_valid && tx_data_ready && tx_cnt < 5'd14)        //sending  byte is finish，发送14bit数据
			begin
				tx_cnt <= tx_cnt + 5'd1;	
			end
			else if(tx_data_valid && tx_data_ready)       //sending last byte is finish
			begin
				tx_cnt <= 5'd0;
				tx_data_valid <= 1'b0;
				state <= WAIT;
			end
			else if(~tx_data_valid)
			begin
				tx_data_valid <= 1'b1;
			end
		end
		WAIT:
		begin
			wait_cnt <= wait_cnt + 32'd1;
			
			if(rx_data_valid)
			begin
				tx_data_valid <= 1'b1;
				tx_data <= rx_data;   // send uart received data
			end
			else if(tx_data_valid && tx_data_ready)
			begin
				tx_data_valid <= 1'b0;
			end
			else if(wait_cnt>Dly_wait) // wait for 1 second，继续发送
			   begin
			    wait_cnt<=32'd0;
				state <= SEND;
				end
		end
		default:
			state <= IDLE;
	endcase
end

always@(*)
begin
	case(tx_cnt)
		5'd0 :  tx_str0 <= "T";
        5'd1 :  tx_str0 <= "e";
        5'd2 :  tx_str0 <= "m";
        5'd3 :  tx_str0 <= "p";
        5'd4 :  tx_str0 <= ":";
        5'd5 :  tx_str0 <= " ";       
        5'd6 :  begin 
                if(read_bcd_Temp[15:12]==4'd0)
                tx_str0 <=8'd32;//SPACE
                 else tx_str0 <=read_bcd_Temp[15:12] +   8'd48;//   ascii值       
                 end
        5'd7 :  begin 
                if(read_bcd_Temp[15:8]==8'd0)
                 tx_str0 <=8'd32;//等于0，显示空白
                else tx_str0 <=read_bcd_Temp[11:8]+    8'd48; // ascii值  
                end         
        5'd8 :  tx_str0 <=read_bcd_Temp[7:4] +    8'd48;// ascii值  
        5'd9 :  tx_str0 <= ".";
        5'd10 :  tx_str0 <=read_bcd_Temp[3:0]  +   8'd48;
        5'd11 :  tx_str0 <= " ";     
        5'd12:  tx_str0 <= "\r";
        5'd13:  tx_str0 <= "\n";        
        default:tx_str0 <= 8'd0;
	endcase
end

always@(*)
begin
	case(tx_cnt)
		5'd0 :  tx_str1 <= "T";
        5'd1 :  tx_str1 <= "e";
        5'd2 :  tx_str1 <= "m";
        5'd3 :  tx_str1 <= "p";
        5'd4 :  tx_str1 <= ":";
        5'd5 :  tx_str1 <= " ";
        5'd6 :  tx_str1 <= "-";
        5'd7 :  tx_str1 <=read_bcd_Temp[15:12] +   8'd48;//ascii值 
        5'd8 :  tx_str1 <=read_bcd_Temp[11:8]+    8'd48; //ascii值 
        5'd9 :  tx_str1 <=read_bcd_Temp[7:4] +    8'd48;//ascii值 
        5'd10 :  tx_str1 <= ".";
        5'd11 :  tx_str1 <=read_bcd_Temp[3:0]  +   8'd48;    //小数
        5'd12:  tx_str1 <= "\r";
        5'd13:  tx_str1 <= "\n";        
        default:tx_str1 <= 8'd0;
	endcase
end
//例化串口收发
uart_rx#
(
	.CLK_FRE(CLK_FRE),
	.BAUD_RATE(115200)
) uart_rx_inst
(
	.clk(clk),
	.rst_n(rst_n),
	.rx_data(rx_data),
	.rx_data_valid(rx_data_valid),
	.rx_data_ready(rx_data_ready),
	.rx_pin(uart_rx)
);

uart_tx#
(
	.CLK_FRE(CLK_FRE),
	.BAUD_RATE(115200)
) uart_tx_inst
(
	.clk(clk),
	.rst_n(rst_n),
	.tx_data(tx_data),
	.tx_data_valid(tx_data_valid),
	.tx_data_ready(tx_data_ready),
	.tx_pin(uart_tx)
);
endmodule 