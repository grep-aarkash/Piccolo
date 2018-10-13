//
// Generated by Bluespec Compiler, version 2017.07.A (build 1da80f1, 2017-07-21)
//
// On Fri Oct 12 19:09:05 EDT 2018
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkTop_HW_Side(CLK,
		     RST_N);
  input  CLK;
  input  RST_N;

  // register rg_banner_printed
  reg rg_banner_printed;
  wire rg_banner_printed$D_IN, rg_banner_printed$EN;

  // ports of submodule mem_model
  wire [352 : 0] mem_model$mem_server_request_put;
  wire [255 : 0] mem_model$mem_server_response_get;
  wire mem_model$EN_mem_server_request_put,
       mem_model$EN_mem_server_response_get,
       mem_model$RDY_mem_server_request_put,
       mem_model$RDY_mem_server_response_get;

  // ports of submodule soc_top
  wire [352 : 0] soc_top$to_raw_mem_request_get;
  wire [255 : 0] soc_top$to_raw_mem_response_put;
  wire [7 : 0] soc_top$get_to_console_get, soc_top$put_from_console_put;
  wire soc_top$EN_get_to_console_get,
       soc_top$EN_put_from_console_put,
       soc_top$EN_to_raw_mem_request_get,
       soc_top$EN_to_raw_mem_response_put,
       soc_top$RDY_get_to_console_get,
       soc_top$RDY_to_raw_mem_request_get,
       soc_top$RDY_to_raw_mem_response_put;

  // rule scheduling signals
  wire CAN_FIRE_RL_memCnx_ClientServerRequest,
       CAN_FIRE_RL_memCnx_ClientServerResponse,
       CAN_FIRE_RL_rl_relay_console_out,
       CAN_FIRE_RL_rl_step0,
       WILL_FIRE_RL_memCnx_ClientServerRequest,
       WILL_FIRE_RL_memCnx_ClientServerResponse,
       WILL_FIRE_RL_rl_relay_console_out,
       WILL_FIRE_RL_rl_step0;

  // submodule mem_model
  mkMem_Model mem_model(.CLK(CLK),
			.RST_N(RST_N),
			.mem_server_request_put(mem_model$mem_server_request_put),
			.EN_mem_server_request_put(mem_model$EN_mem_server_request_put),
			.EN_mem_server_response_get(mem_model$EN_mem_server_response_get),
			.RDY_mem_server_request_put(mem_model$RDY_mem_server_request_put),
			.mem_server_response_get(mem_model$mem_server_response_get),
			.RDY_mem_server_response_get(mem_model$RDY_mem_server_response_get));

  // submodule soc_top
  mkSoC_Top soc_top(.CLK(CLK),
		    .RST_N(RST_N),
		    .put_from_console_put(soc_top$put_from_console_put),
		    .to_raw_mem_response_put(soc_top$to_raw_mem_response_put),
		    .EN_to_raw_mem_request_get(soc_top$EN_to_raw_mem_request_get),
		    .EN_to_raw_mem_response_put(soc_top$EN_to_raw_mem_response_put),
		    .EN_get_to_console_get(soc_top$EN_get_to_console_get),
		    .EN_put_from_console_put(soc_top$EN_put_from_console_put),
		    .to_raw_mem_request_get(soc_top$to_raw_mem_request_get),
		    .RDY_to_raw_mem_request_get(soc_top$RDY_to_raw_mem_request_get),
		    .RDY_to_raw_mem_response_put(soc_top$RDY_to_raw_mem_response_put),
		    .get_to_console_get(soc_top$get_to_console_get),
		    .RDY_get_to_console_get(soc_top$RDY_get_to_console_get),
		    .RDY_put_from_console_put());

  // rule RL_rl_step0
  assign CAN_FIRE_RL_rl_step0 = !rg_banner_printed ;
  assign WILL_FIRE_RL_rl_step0 = CAN_FIRE_RL_rl_step0 ;

  // rule RL_rl_relay_console_out
  assign CAN_FIRE_RL_rl_relay_console_out = soc_top$RDY_get_to_console_get ;
  assign WILL_FIRE_RL_rl_relay_console_out = soc_top$RDY_get_to_console_get ;

  // rule RL_memCnx_ClientServerRequest
  assign CAN_FIRE_RL_memCnx_ClientServerRequest =
	     soc_top$RDY_to_raw_mem_request_get &&
	     mem_model$RDY_mem_server_request_put ;
  assign WILL_FIRE_RL_memCnx_ClientServerRequest =
	     CAN_FIRE_RL_memCnx_ClientServerRequest ;

  // rule RL_memCnx_ClientServerResponse
  assign CAN_FIRE_RL_memCnx_ClientServerResponse =
	     soc_top$RDY_to_raw_mem_response_put &&
	     mem_model$RDY_mem_server_response_get ;
  assign WILL_FIRE_RL_memCnx_ClientServerResponse =
	     CAN_FIRE_RL_memCnx_ClientServerResponse ;

  // register rg_banner_printed
  assign rg_banner_printed$D_IN = 1'd1 ;
  assign rg_banner_printed$EN = CAN_FIRE_RL_rl_step0 ;

  // submodule mem_model
  assign mem_model$mem_server_request_put = soc_top$to_raw_mem_request_get ;
  assign mem_model$EN_mem_server_request_put =
	     CAN_FIRE_RL_memCnx_ClientServerRequest ;
  assign mem_model$EN_mem_server_response_get =
	     CAN_FIRE_RL_memCnx_ClientServerResponse ;

  // submodule soc_top
  assign soc_top$put_from_console_put = 8'h0 ;
  assign soc_top$to_raw_mem_response_put = mem_model$mem_server_response_get ;
  assign soc_top$EN_to_raw_mem_request_get =
	     CAN_FIRE_RL_memCnx_ClientServerRequest ;
  assign soc_top$EN_to_raw_mem_response_put =
	     CAN_FIRE_RL_memCnx_ClientServerResponse ;
  assign soc_top$EN_get_to_console_get = soc_top$RDY_get_to_console_get ;
  assign soc_top$EN_put_from_console_put = 1'b0 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_banner_printed <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (rg_banner_printed$EN)
	  rg_banner_printed <= `BSV_ASSIGNMENT_DELAY rg_banner_printed$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_banner_printed = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	$display("================================================================");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	$display("Bluespec RISC-V standalone system simulation v1.2");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	$display("Copyright (c) 2017-2018 Bluespec, Inc. All Rights Reserved.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	$display("================================================================");
    if (RST_N != `BSV_RESET_VALUE)
      if (soc_top$RDY_get_to_console_get)
	$write("%c", soc_top$get_to_console_get);
    if (RST_N != `BSV_RESET_VALUE)
      if (soc_top$RDY_get_to_console_get) $fflush(32'h80000001);
  end
  // synopsys translate_on
endmodule  // mkTop_HW_Side

