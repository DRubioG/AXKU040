//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: lhj                                                                 //
 //                                                                             //
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

//===============================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//-------------------------------------------------------------------------------
//  2018/01/03    lhj        1.0         Original
//*******************************************************************************/
module key_debounce
(
input        sys_clk_p,      // Differentia system clock 200Mhz input on board
input        sys_clk_n,
input        rst_n,//��λ
input        key,//��������
output [3:0] led//led����ʾ
);
//===========================================================================
//Differentia system clock to single end clock
//===========================================================================
wire        sys_clk;
 IBUFGDS u_ibufg_sys_clk
   (
    .I  (sys_clk_p),            
    .IB (sys_clk_n),          //���ʱ������
    .O  (sys_clk  )        
    );  
wire        button_negedge; //Key falling edge
ax_debounce ax_debounce_m0
(
    .clk             (sys_clk       ),
    .rst             (~rst_n        ),//��λ����Ч
    .button_in       (key           ),//����
    .button_posedge  (              ),
    .button_negedge  (button_negedge),//�������½���
    .button_out      (              )
);

wire[3:0]   count;
wire        t0;
count_m10 count10_m0
(
    .clk             (sys_clk       ),
    .rst_n           (rst_n         ),//��λ����Ч
    .en              (button_negedge),//�������½���
    .clr             (1'b0          ),//�첽��λ������Ч
    .data            (count         ),//����
    .t               (t0            )//ʹ��
);
assign led = count;
endmodule 