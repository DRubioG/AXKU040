//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: lhj                                                                 //
//                                                                              //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//  2018/01/05     lhj         1.0         Original
//*******************************************************************************/
module sd_card_test(
input           sys_clk_p,      // Differentia system clock 200Mhz input on board
input           sys_clk_n,
input            rst_n,
input            key,
//sd卡接口
output           sd_ncs,
output           sd_dclk,
output           sd_mosi,
input            sd_miso,
//led显示
output [3:0]     led
);
parameter S_IDLE         = 0;
parameter S_READ         = 1;
parameter S_WRITE        = 2;
parameter S_END          = 3;

reg[3:0] state;
wire             sd_init_done;
//sd读数据接口
reg              sd_sec_read;//使能
wire[31:0]       sd_sec_read_addr;//地址
wire[7:0]        sd_sec_read_data;//数据
wire             sd_sec_read_data_valid;//开始读数据
wire             sd_sec_read_end;//读数据完成
//sd写数据接口
reg              sd_sec_write;
wire[31:0]       sd_sec_write_addr;
reg [7:0]        sd_sec_write_data;
wire             sd_sec_write_data_req;//请求写
wire             sd_sec_write_end;
reg[9:0]         wr_cnt;
reg[9:0]         rd_cnt;
wire             button_negedge;//按键按下
reg[7:0]         read_data;

assign  sd_sec_read_addr = 32'd0;
assign  sd_sec_write_addr = 32'd0;

assign  led = read_data[3:0];

//===========================================================================
//Differentia system clock to single end clock
//===========================================================================
wire        sys_clk;
/////////////////////PLL IP call////////////////////////////
clk_ref clk_sdcard_m0
   (// Clock in ports
    .clk_in1_p  (sys_clk_p ),               // Differentia  clock  200Mhz input
    .clk_in1_n  (sys_clk_n ),               
    // Clock out ports
    .clk_out1   (sys_clk   ),              // OUT 50Mhz
    // Status and control signals	 
    .reset      (~rst_n    ),         // RESET IN
    .locked     (          ));      // OUT
ax_debounce ax_debounce_m0
(
	.clk             (sys_clk),
	.rst             (~rst_n),
	.button_in       (key),
	.button_posedge  (),
	.button_negedge  (button_negedge),
	.button_out      ()
);

always@(posedge sys_clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		wr_cnt <= 10'd0;
	else if(state == S_WRITE)
	begin
		if(sd_sec_write_data_req == 1'b1)//sd写请求
			wr_cnt <= wr_cnt + 10'd1;//写计数
	end
	else
		wr_cnt <= 10'd0;
end

always@(posedge sys_clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		rd_cnt <= 10'd0;
	else if(state == S_READ)
	begin
		if(sd_sec_read_data_valid == 1'b1)
			rd_cnt <= rd_cnt + 10'd1;//读计数
	end
	else
		rd_cnt <= 10'd0;
end

always@(posedge sys_clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		read_data <= 8'd0;
	else if(state == S_READ)
	begin
		if(sd_sec_read_data_valid == 1'b1 && rd_cnt == 10'd0)//重新下载程序后读到存储数据
			read_data <= sd_sec_read_data;//读sd存储数据
	end
	else if(state == S_END && button_negedge == 1'b1) //按键按下存储数据加1
		read_data <= read_data + 8'd1;
end

always@(posedge sys_clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		sd_sec_write_data <= 8'd0;
	else if(sd_sec_write_data_req)
		sd_sec_write_data <= read_data + wr_cnt[7:0];
end
//状态机
always@(posedge sys_clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
	begin
		state <= S_IDLE;
		sd_sec_read <= 1'b0;
		sd_sec_write <= 1'b0;
	end
	else if(sd_init_done == 1'b0)
	begin
		state <= S_IDLE;
	end
	else
		case(state)
			S_IDLE://初态
			begin
				state <= S_READ;
			end
			S_WRITE:
			begin
				if(sd_sec_write_end == 1'b1)//写完进入读状态
				begin
					sd_sec_write <= 1'b0;
					state <= S_READ;
				end
				else
					sd_sec_write <= 1'b1;
			end
			
			S_READ:
			begin
				if(sd_sec_read_end == 1'b1)//读完进入结束状态
				begin
					state <= S_END;
					sd_sec_read <= 1'b0;
				end
				else
				begin
					sd_sec_read <= 1'b1;
				end                 
			end         
			S_END:
			begin
				if(button_negedge == 1'b1)//按键按下进入写状态
					state <= S_WRITE;
			end
			default:
				state <= S_IDLE;
		endcase
end
//例化
/***************************/
sd_card_top  sd_card_top_m0(
	.clk                       (sys_clk                ),
	.rst                       (~rst_n                 ),
	.SD_nCS                    (sd_ncs                 ),
	.SD_DCLK                   (sd_dclk                ),
	.SD_MOSI                   (sd_mosi                ),
	.SD_MISO                   (sd_miso                ),
	.sd_init_done              (sd_init_done           ),
	.sd_sec_read               (sd_sec_read            ),
	.sd_sec_read_addr          (sd_sec_read_addr       ),
	.sd_sec_read_data          (sd_sec_read_data       ),
	.sd_sec_read_data_valid    (sd_sec_read_data_valid ),
	.sd_sec_read_end           (sd_sec_read_end        ),
	.sd_sec_write              (sd_sec_write           ),
	.sd_sec_write_addr         (sd_sec_write_addr      ),
	.sd_sec_write_data         (sd_sec_write_data      ),
	.sd_sec_write_data_req     (sd_sec_write_data_req  ),
	.sd_sec_write_end          (sd_sec_write_end       )
);

ila_0 ila_m0(
	.clk(sys_clk), // input wire clk


	.probe0(sd_sec_read_data_valid),       // input wire [0:0]  probe0  
	.probe1(sd_sec_read_data),            // input wire [7:0]  probe1 
	.probe2(sd_sec_write_data_req),     // input wire [0:0]  probe2 
	.probe3(sd_sec_write_data)        // input wire [7:0]  probe3
);
endmodule 