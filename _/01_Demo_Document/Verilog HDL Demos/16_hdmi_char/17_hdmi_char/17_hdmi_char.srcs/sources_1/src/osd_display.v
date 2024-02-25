//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
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
//2017/8/20                    1.0          Original
//*******************************************************************************/
module osd_display(
	input                       rst_n,   
	input                       pclk,//像素时钟
	input[23:0]                 wave_color,//字符颜色
	input                       adc_clk,//ADC接口无用，移植错误
	input                       adc_buf_wr,
	input[11:0]                 adc_buf_addr,
	input[7:0]                  adc_buf_data,
	input                       i_hs,    //输入行同步信号
	input                       i_vs,    //输入场同步信号
	input                       i_de,	//输入使能
	input[23:0]                 i_data,  //输入RGB888数据
	output                      o_hs,    //输出行同步信号
	output                      o_vs,    //输出场同步信号
	output                      o_de,    //输出使能
	output[23:0]                o_data//输出RGB888数据
);
parameter OSD_WIDTH   =  12'd144;//字符宽度
parameter OSD_HEGIHT  =  12'd32;//字符高度

wire[11:0] pos_x;//x位置
wire[11:0] pos_y;//y位置
wire       pos_hs;//中间行同步信号
wire       pos_vs;//中间场同步信号
wire       pos_de;//中间使能
wire[23:0] pos_data;//中间数据
reg[23:0]  v_data;
reg[11:0]  osd_x;//字符显示区域内x位置
reg[11:0]  osd_y;//字符显示区域内y位置
reg[15:0]  osd_ram_addr;//ROM地址
wire[7:0]  q;
reg        region_active;//显示区域有效信号
reg        region_active_d0;//缓存
reg        region_active_d1;
reg        region_active_d2;

reg        pos_vs_d0;//缓存
reg        pos_vs_d1;

assign o_data = v_data;
assign o_hs = pos_hs;
assign o_vs = pos_vs;
assign o_de = pos_de;
//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= 12'd9 && pos_y <= 12'd9 + OSD_HEGIHT - 12'd1 && pos_x >= 12'd9 && pos_x  <= 12'd9 + OSD_WIDTH - 12'd1)//定义字符区域
		region_active <= 1'b1;//控制读ROM
	else
		region_active <= 1'b0;
end

always@(posedge pclk)
begin
	region_active_d0 <= region_active;
	region_active_d1 <= region_active_d0;
	region_active_d2 <= region_active_d1;//延迟3周期
end

always@(posedge pclk)
begin
	pos_vs_d0 <= pos_vs;
	pos_vs_d1 <= pos_vs_d0;//延迟2周期
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active_d0 == 1'b1)
		osd_x <= osd_x + 12'd1;//字符显示区域内x位置
	else
		osd_x <= 12'd0;
end

always@(posedge pclk)
begin
	if(pos_vs_d1 == 1'b1 && pos_vs_d0 == 1'b0)//下降沿
		osd_ram_addr <= 16'd0;
	else if(region_active == 1'b1)
		osd_ram_addr <= osd_ram_addr + 16'd1;//地址加1
end


always@(posedge pclk)
begin
	if(region_active_d0 == 1'b1)
		if(q[osd_x[2:0]] == 1'b1)//q的8位，均不为0，显示红色
			v_data <= 24'hff0000;//红色
		else
			v_data <= pos_data;//q为0，显示彩条原本的颜色
	else
		v_data <= pos_data;
end
//ROM中有字符的初始化文件
osd_rom osd_rom_m0 (
	.clka                       (pclk                    ),   
	.ena                        (1'b1                    ),     
	.addra                      (osd_ram_addr[15:3]      ), 
	.douta                      (q                       )  
);
//获得xy坐标
timing_gen_xy timing_gen_xy_m0(
	.rst_n    (rst_n    ),
	.clk      (pclk     ),
	.i_hs     (i_hs     ),
	.i_vs     (i_vs     ),
	.i_de     (i_de     ),
	.i_data   (i_data   ),
	.o_hs     (pos_hs   ),
	.o_vs     (pos_vs   ),
	.o_de     (pos_de   ),
	.o_data   (pos_data ),
	.x        (pos_x    ),//x坐标
	.y        (pos_y    )//y坐标
);
endmodule