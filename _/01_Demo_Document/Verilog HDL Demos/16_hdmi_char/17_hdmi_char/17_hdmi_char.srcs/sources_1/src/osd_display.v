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
	input                       pclk,//����ʱ��
	input[23:0]                 wave_color,//�ַ���ɫ
	input                       adc_clk,//ADC�ӿ����ã���ֲ����
	input                       adc_buf_wr,
	input[11:0]                 adc_buf_addr,
	input[7:0]                  adc_buf_data,
	input                       i_hs,    //������ͬ���ź�
	input                       i_vs,    //���볡ͬ���ź�
	input                       i_de,	//����ʹ��
	input[23:0]                 i_data,  //����RGB888����
	output                      o_hs,    //�����ͬ���ź�
	output                      o_vs,    //�����ͬ���ź�
	output                      o_de,    //���ʹ��
	output[23:0]                o_data//���RGB888����
);
parameter OSD_WIDTH   =  12'd144;//�ַ����
parameter OSD_HEGIHT  =  12'd32;//�ַ��߶�

wire[11:0] pos_x;//xλ��
wire[11:0] pos_y;//yλ��
wire       pos_hs;//�м���ͬ���ź�
wire       pos_vs;//�м䳡ͬ���ź�
wire       pos_de;//�м�ʹ��
wire[23:0] pos_data;//�м�����
reg[23:0]  v_data;
reg[11:0]  osd_x;//�ַ���ʾ������xλ��
reg[11:0]  osd_y;//�ַ���ʾ������yλ��
reg[15:0]  osd_ram_addr;//ROM��ַ
wire[7:0]  q;
reg        region_active;//��ʾ������Ч�ź�
reg        region_active_d0;//����
reg        region_active_d1;
reg        region_active_d2;

reg        pos_vs_d0;//����
reg        pos_vs_d1;

assign o_data = v_data;
assign o_hs = pos_hs;
assign o_vs = pos_vs;
assign o_de = pos_de;
//delay 1 clock 
always@(posedge pclk)
begin
	if(pos_y >= 12'd9 && pos_y <= 12'd9 + OSD_HEGIHT - 12'd1 && pos_x >= 12'd9 && pos_x  <= 12'd9 + OSD_WIDTH - 12'd1)//�����ַ�����
		region_active <= 1'b1;//���ƶ�ROM
	else
		region_active <= 1'b0;
end

always@(posedge pclk)
begin
	region_active_d0 <= region_active;
	region_active_d1 <= region_active_d0;
	region_active_d2 <= region_active_d1;//�ӳ�3����
end

always@(posedge pclk)
begin
	pos_vs_d0 <= pos_vs;
	pos_vs_d1 <= pos_vs_d0;//�ӳ�2����
end

//delay 2 clock
//region_active_d0
always@(posedge pclk)
begin
	if(region_active_d0 == 1'b1)
		osd_x <= osd_x + 12'd1;//�ַ���ʾ������xλ��
	else
		osd_x <= 12'd0;
end

always@(posedge pclk)
begin
	if(pos_vs_d1 == 1'b1 && pos_vs_d0 == 1'b0)//�½���
		osd_ram_addr <= 16'd0;
	else if(region_active == 1'b1)
		osd_ram_addr <= osd_ram_addr + 16'd1;//��ַ��1
end


always@(posedge pclk)
begin
	if(region_active_d0 == 1'b1)
		if(q[osd_x[2:0]] == 1'b1)//q��8λ������Ϊ0����ʾ��ɫ
			v_data <= 24'hff0000;//��ɫ
		else
			v_data <= pos_data;//qΪ0����ʾ����ԭ������ɫ
	else
		v_data <= pos_data;
end
//ROM�����ַ��ĳ�ʼ���ļ�
osd_rom osd_rom_m0 (
	.clka                       (pclk                    ),   
	.ena                        (1'b1                    ),     
	.addra                      (osd_ram_addr[15:3]      ), 
	.douta                      (q                       )  
);
//���xy����
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
	.x        (pos_x    ),//x����
	.y        (pos_y    )//y����
);
endmodule