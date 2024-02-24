//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: lhj                                                               //
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

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//2018/1/3                    1.0          Original
//*******************************************************************************/

module uart_test(
input                           sys_clk_p,      // Differentia system clock 200Mhz input on board
input                           sys_clk_n,
input                           rst_n,//复位
input                           uart_rx,//串口接收
output                          uart_tx//串口发送
);

parameter                      CLK_FRE = 200;//Mhz
localparam                       IDLE =  0;
localparam                       SEND =  1;   //send HELLO ALINX\r\n
localparam                       WAIT =  2;   //wait 1 second and send uart received data
reg[7:0]                         tx_data;//发送数据
reg[7:0]                         tx_str;//字符
reg                              tx_data_valid;//数据发送有效
wire                             tx_data_ready;//数据准备发送
reg[7:0]                         tx_cnt;//发送bit计数
wire[7:0]                        rx_data;//接收数据
wire                             rx_data_valid;//接收数据有效
wire                             rx_data_ready;//准备接收数据
reg[31:0]                        wait_cnt;//等待时间计数器
reg[3:0]                         state;//状态

//===========================================================================
//Differentia system clock to single end clock
//===========================================================================
wire        sys_clk;
 IBUFGDS u_ibufg_sys_clk
   (
    .I  (sys_clk_p),            
    .IB (sys_clk_n),          //系统时钟
    .O  (sys_clk  )        
    );  
assign rx_data_ready = 1'b1;//always can receive data,
							//if HELLO ALINX\r\n is being sent, the received data is discarded
 
always@(posedge sys_clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
	begin
		wait_cnt <= 32'd0;
		tx_data <= 8'd0;
		state <= IDLE;
		tx_cnt <= 8'd0;
		tx_data_valid <= 1'b0;
	end
	else
	case(state)
		IDLE:
			state <= SEND;
		SEND:
		begin
			wait_cnt <= 32'd0;
			tx_data <= tx_str;//串行数据"HELLO ALINX\r\n"
			if(tx_data_valid == 1'b1 && tx_data_ready == 1'b1 && tx_cnt < 8'd12)//Send 12 bytes data
			begin
				tx_cnt <= tx_cnt + 8'd1; //Send data counter
			end
			else if(tx_data_valid && tx_data_ready)//last byte sent is complete
			begin
				tx_cnt <= 8'd0;
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

			if(rx_data_valid == 1'b1)
			begin
				tx_data_valid <= 1'b1;
				tx_data <= rx_data;   // send uart received data
			end
			else if(tx_data_valid && tx_data_ready)
			begin
				tx_data_valid <= 1'b0;
			end
			else if(wait_cnt >= CLK_FRE * 1000000) // wait for 1 second
				state <= SEND;
		end
		default:
			state <= IDLE;
	endcase
end

//combinational logic
//Send "HELLO ALINX\r\n"
always@(*)
begin
	case(tx_cnt)
		8'd0 :  tx_str <= "H";
		8'd1 :  tx_str <= "E";
		8'd2 :  tx_str <= "L";
		8'd3 :  tx_str <= "L";
		8'd4 :  tx_str <= "O";
		8'd5 :  tx_str <= " ";
		8'd6 :  tx_str <= "A";
		8'd7 :  tx_str <= "L";
		8'd8 :  tx_str <= "I";
		8'd9 :  tx_str <= "N";
		8'd10:  tx_str <= "X";
		8'd11:  tx_str <= "\r";
		8'd12:  tx_str <= "\n";
		default:tx_str <= 8'd0;
	endcase
end
//例化接收和发送模块
uart_rx#
(
	.CLK_FRE(CLK_FRE),
	.BAUD_RATE(115200)
) uart_rx_inst
(
	.clk                        (sys_clk                  ),
	.rst_n                      (rst_n                    ),
	.rx_data                    (rx_data                  ),
	.rx_data_valid              (rx_data_valid            ),
	.rx_data_ready              (rx_data_ready            ),
	.rx_pin                     (uart_rx                  )
);

uart_tx#
(
	.CLK_FRE(CLK_FRE),
	.BAUD_RATE(115200)
) uart_tx_inst
(
	.clk                        (sys_clk                  ),
	.rst_n                      (rst_n                    ),
	.tx_data                    (tx_data                  ),
	.tx_data_valid              (tx_data_valid            ),
	.tx_data_ready              (tx_data_ready            ),
	.tx_pin                     (uart_tx                  )
);
endmodule