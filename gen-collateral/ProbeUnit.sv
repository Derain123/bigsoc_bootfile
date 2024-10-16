// Generated by CIRCT unknown git version
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

module ProbeUnit(
  input         clock,
                reset,
                io_req_valid,
  input  [1:0]  io_req_bits_param,
  input  [3:0]  io_req_bits_size,
  input  [1:0]  io_req_bits_source,
  input  [31:0] io_req_bits_address,
  input         io_rep_ready,
                io_meta_read_ready,
                io_meta_write_ready,
                io_wb_req_ready,
  input  [7:0]  io_way_en,
  input         io_mshr_rdy,
  input  [1:0]  io_block_state_state,
  output        io_req_ready,
                io_rep_valid,
  output [2:0]  io_rep_bits_param,
  output [3:0]  io_rep_bits_size,
  output [1:0]  io_rep_bits_source,
  output [31:0] io_rep_bits_address,
  output        io_meta_read_valid,
  output [4:0]  io_meta_read_bits_idx,
  output [20:0] io_meta_read_bits_tag,
  output        io_meta_write_valid,
  output [4:0]  io_meta_write_bits_idx,
  output [7:0]  io_meta_write_bits_way_en,
  output [1:0]  io_meta_write_bits_data_coh_state,
  output [20:0] io_meta_write_bits_data_tag,
  output        io_wb_req_valid,
  output [20:0] io_wb_req_bits_tag,
  output [4:0]  io_wb_req_bits_idx,
  output [1:0]  io_wb_req_bits_source,
  output [2:0]  io_wb_req_bits_param,
  output [7:0]  io_wb_req_bits_way_en
);

  reg  [3:0]  state;	// @[NBDcache.scala:552:22]
  reg  [1:0]  req_param;	// @[NBDcache.scala:554:16]
  reg  [3:0]  req_size;	// @[NBDcache.scala:554:16]
  reg  [1:0]  req_source;	// @[NBDcache.scala:554:16]
  reg  [31:0] req_address;	// @[NBDcache.scala:554:16]
  reg  [7:0]  way_en;	// @[NBDcache.scala:558:19]
  reg  [1:0]  old_coh_state;	// @[NBDcache.scala:560:20]
  wire [3:0]  _T = {req_param, (|way_en) ? old_coh_state : 2'h0};	// @[Cat.scala:33:92, Metadata.scala:161:16, NBDcache.scala:554:16, :558:19, :559:28, :560:20, :562:22]
  wire        _T_26 = _T == 4'hB;	// @[Cat.scala:33:92, Misc.scala:55:20]
  wire        _T_29 = _T == 4'h4;	// @[Cat.scala:33:92, Misc.scala:55:20, NBDcache.scala:612:17]
  wire        _T_33 = _T == 4'h5;	// @[Cat.scala:33:92, Misc.scala:55:20, NBDcache.scala:566:25]
  wire        _T_37 = _T == 4'h6;	// @[Cat.scala:33:92, Misc.scala:55:20, NBDcache.scala:584:28]
  wire        _T_41 = _T == 4'h7;	// @[Cat.scala:33:92, Misc.scala:55:20, NBDcache.scala:625:11]
  wire        _T_45 = _T == 4'h0;	// @[Cat.scala:33:92, Misc.scala:55:20, NBDcache.scala:552:22]
  wire        _T_49 = _T == 4'h1;	// @[Cat.scala:33:92, Misc.scala:55:20, NBDcache.scala:572:31]
  wire        _T_53 = _T == 4'h2;	// @[Cat.scala:33:92, Misc.scala:55:20, NBDcache.scala:600:11]
  wire        _T_57 = _T == 4'h3;	// @[Cat.scala:33:92, Misc.scala:55:20, NBDcache.scala:605:11]
  wire        _GEN = _T_57 | _T_53;	// @[Misc.scala:37:36, :55:20]
  wire [2:0]  io_rep_bits_c_param = _GEN ? 3'h3 : _T_49 ? 3'h4 : _T_45 ? 3'h5 : _T_41 | _T_37 ? 3'h0 : _T_33 ? 3'h4 : _T_29 ? 3'h5 : _T_26 | _T == 4'hA ? 3'h1 : _T == 4'h9 ? 3'h2 : _T == 4'h8 ? 3'h5 : 3'h0;	// @[Cat.scala:33:92, Misc.scala:37:36, :55:20, NBDcache.scala:577:32]
  wire        _io_req_ready_output = state == 4'h0;	// @[NBDcache.scala:552:22, :565:25]
  wire        _T_70 = state == 4'h5;	// @[NBDcache.scala:552:22, :566:25]
  wire        _io_meta_read_valid_output = state == 4'h1;	// @[NBDcache.scala:552:22, :572:31]
  wire        _io_meta_write_valid_output = state == 4'h8;	// @[NBDcache.scala:552:22, :577:32]
  wire        _io_wb_req_valid_output = state == 4'h6;	// @[NBDcache.scala:552:22, :584:28]
  wire        _T_65 = _io_req_ready_output & io_req_valid;	// @[Decoupled.scala:51:35, NBDcache.scala:565:25]
  wire        _T_68 = state == 4'h3;	// @[NBDcache.scala:552:22, :605:11, :608:15]
  always @(posedge clock) begin
    if (reset)
      state <= 4'h0;	// @[NBDcache.scala:552:22]
    else if (io_meta_write_ready & _io_meta_write_valid_output)	// @[Decoupled.scala:51:35, NBDcache.scala:577:32]
      state <= 4'h0;	// @[NBDcache.scala:552:22]
    else if (state == 4'h7 & io_wb_req_ready)	// @[NBDcache.scala:552:22, :625:11, :629:{15,36}]
      state <= 4'h8;	// @[NBDcache.scala:552:22, :577:32]
    else if (io_wb_req_ready & _io_wb_req_valid_output)	// @[Decoupled.scala:51:35, NBDcache.scala:584:28]
      state <= 4'h7;	// @[NBDcache.scala:552:22, :625:11]
    else if (_T_70 & io_rep_ready)	// @[NBDcache.scala:566:25, :619:29]
      state <= {|way_en, 3'h0};	// @[Misc.scala:37:36, NBDcache.scala:552:22, :558:19, :559:28, :620:17]
    else if (state == 4'h4) begin	// @[NBDcache.scala:552:22, :612:17, :615:15]
      if ((|way_en) & (_T_57 | ~(_T_53 | _T_49 | _T_45) & (_T_41 | ~(_T_37 | _T_33 | _T_29) & _T_26)))	// @[Misc.scala:37:9, :55:20, NBDcache.scala:558:19, :559:28, :616:30]
        state <= 4'h6;	// @[NBDcache.scala:552:22, :584:28]
      else	// @[NBDcache.scala:616:30]
        state <= 4'h5;	// @[NBDcache.scala:552:22, :566:25]
    end
    else if (_T_68) begin	// @[NBDcache.scala:608:15]
      if (io_mshr_rdy)
        state <= 4'h4;	// @[NBDcache.scala:552:22, :612:17]
      else
        state <= 4'h1;	// @[NBDcache.scala:552:22, :572:31]
    end
    else if (state == 4'h2)	// @[NBDcache.scala:552:22, :600:11, :604:15]
      state <= 4'h3;	// @[NBDcache.scala:552:22, :605:11]
    else if (io_meta_read_ready & _io_meta_read_valid_output)	// @[Decoupled.scala:51:35, NBDcache.scala:572:31]
      state <= 4'h2;	// @[NBDcache.scala:552:22, :600:11]
    else if (_T_65)	// @[Decoupled.scala:51:35]
      state <= 4'h1;	// @[NBDcache.scala:552:22, :572:31]
    if (_T_65) begin	// @[Decoupled.scala:51:35]
      req_param <= io_req_bits_param;	// @[NBDcache.scala:554:16]
      req_size <= io_req_bits_size;	// @[NBDcache.scala:554:16]
      req_source <= io_req_bits_source;	// @[NBDcache.scala:554:16]
      req_address <= io_req_bits_address;	// @[NBDcache.scala:554:16]
    end
    if (_T_68) begin	// @[NBDcache.scala:608:15]
      way_en <= io_way_en;	// @[NBDcache.scala:558:19]
      old_coh_state <= io_block_state_state;	// @[NBDcache.scala:560:20]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    logic [31:0] _RANDOM_4;
    logic [31:0] _RANDOM_5;
    logic [31:0] _RANDOM_6;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        _RANDOM_2 = `RANDOM;
        _RANDOM_3 = `RANDOM;
        _RANDOM_4 = `RANDOM;
        _RANDOM_5 = `RANDOM;
        _RANDOM_6 = `RANDOM;
        state = _RANDOM_0[3:0];	// @[NBDcache.scala:552:22]
        req_param = _RANDOM_0[8:7];	// @[NBDcache.scala:552:22, :554:16]
        req_size = _RANDOM_0[12:9];	// @[NBDcache.scala:552:22, :554:16]
        req_source = _RANDOM_0[14:13];	// @[NBDcache.scala:552:22, :554:16]
        req_address = {_RANDOM_0[31:15], _RANDOM_1[14:0]};	// @[NBDcache.scala:552:22, :554:16]
        way_en = _RANDOM_6[7:0];	// @[NBDcache.scala:558:19]
        old_coh_state = _RANDOM_6[9:8];	// @[NBDcache.scala:558:19, :560:20]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_req_ready = _io_req_ready_output;	// @[NBDcache.scala:565:25]
  assign io_rep_valid = _T_70;	// @[NBDcache.scala:566:25]
  assign io_rep_bits_param = io_rep_bits_c_param;	// @[Misc.scala:37:36]
  assign io_rep_bits_size = req_size;	// @[NBDcache.scala:554:16]
  assign io_rep_bits_source = req_source;	// @[NBDcache.scala:554:16]
  assign io_rep_bits_address = req_address;	// @[NBDcache.scala:554:16]
  assign io_meta_read_valid = _io_meta_read_valid_output;	// @[NBDcache.scala:572:31]
  assign io_meta_read_bits_idx = req_address[10:6];	// @[NBDcache.scala:554:16, :555:28]
  assign io_meta_read_bits_tag = req_address[31:11];	// @[NBDcache.scala:554:16, :556:29]
  assign io_meta_write_valid = _io_meta_write_valid_output;	// @[NBDcache.scala:577:32]
  assign io_meta_write_bits_idx = req_address[10:6];	// @[NBDcache.scala:554:16, :555:28]
  assign io_meta_write_bits_way_en = way_en;	// @[NBDcache.scala:558:19]
  assign io_meta_write_bits_data_coh_state = _GEN ? 2'h2 : _T_49 ? 2'h1 : _T_45 ? 2'h0 : {1'h0, _T_41 | _T_37 | _T_33};	// @[Cat.scala:33:92, Metadata.scala:161:16, Misc.scala:37:{36,63}, :55:20, NBDcache.scala:554:16]
  assign io_meta_write_bits_data_tag = req_address[31:11];	// @[NBDcache.scala:554:16, :556:29]
  assign io_wb_req_valid = _io_wb_req_valid_output;	// @[NBDcache.scala:584:28]
  assign io_wb_req_bits_tag = req_address[31:11];	// @[NBDcache.scala:554:16, :556:29]
  assign io_wb_req_bits_idx = req_address[10:6];	// @[NBDcache.scala:554:16, :555:28]
  assign io_wb_req_bits_source = req_source;	// @[NBDcache.scala:554:16]
  assign io_wb_req_bits_param = io_rep_bits_c_param;	// @[Misc.scala:37:36]
  assign io_wb_req_bits_way_en = way_en;	// @[NBDcache.scala:558:19]
endmodule

