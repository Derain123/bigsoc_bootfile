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

module RegisterFileSynthesizable_1(
  input         clock,
                reset,
  input  [6:0]  io_read_ports_0_addr,
                io_read_ports_1_addr,
                io_read_ports_2_addr,
                io_read_ports_3_addr,
                io_read_ports_4_addr,
                io_read_ports_5_addr,
                io_read_ports_6_addr,
                io_read_ports_7_addr,
  input         io_write_ports_0_valid,
  input  [6:0]  io_write_ports_0_bits_addr,
  input  [63:0] io_write_ports_0_bits_data,
  input         io_write_ports_1_valid,
  input  [6:0]  io_write_ports_1_bits_addr,
  input  [63:0] io_write_ports_1_bits_data,
  input         io_write_ports_2_valid,
  input  [6:0]  io_write_ports_2_bits_addr,
  input  [63:0] io_write_ports_2_bits_data,
  input         io_write_ports_3_valid,
  input  [6:0]  io_write_ports_3_bits_addr,
  input  [63:0] io_write_ports_3_bits_data,
  output [63:0] io_read_ports_0_data,
                io_read_ports_1_data,
                io_read_ports_2_data,
                io_read_ports_3_data,
                io_read_ports_4_data,
                io_read_ports_5_data,
                io_read_ports_6_data,
                io_read_ports_7_data
);

  wire [63:0] _regfile_ext_R0_data;	// @[regfile.scala:117:20]
  wire [63:0] _regfile_ext_R1_data;	// @[regfile.scala:117:20]
  wire [63:0] _regfile_ext_R2_data;	// @[regfile.scala:117:20]
  wire [63:0] _regfile_ext_R3_data;	// @[regfile.scala:117:20]
  wire [63:0] _regfile_ext_R4_data;	// @[regfile.scala:117:20]
  wire [63:0] _regfile_ext_R5_data;	// @[regfile.scala:117:20]
  wire [63:0] _regfile_ext_R6_data;	// @[regfile.scala:117:20]
  wire [63:0] _regfile_ext_R7_data;	// @[regfile.scala:117:20]
  reg  [6:0]  read_addrs_0;	// @[regfile.scala:125:50]
  reg  [6:0]  read_addrs_1;	// @[regfile.scala:125:50]
  reg  [6:0]  read_addrs_2;	// @[regfile.scala:125:50]
  reg  [6:0]  read_addrs_3;	// @[regfile.scala:125:50]
  reg  [6:0]  read_addrs_4;	// @[regfile.scala:125:50]
  reg  [6:0]  read_addrs_5;	// @[regfile.scala:125:50]
  reg  [6:0]  read_addrs_6;	// @[regfile.scala:125:50]
  reg  [6:0]  read_addrs_7;	// @[regfile.scala:125:50]
  wire        _bypass_data_WIRE_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_0;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_0;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_0;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_0;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_2_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_1;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_2_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_1;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_2_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_1;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_2_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_1;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_4_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_2;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_4_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_2;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_4_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_2;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_4_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_2;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_6_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_3;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_6_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_3;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_6_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_3;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_6_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_3;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_8_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_4;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_8_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_4;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_8_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_4;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_8_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_4;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_10_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_5;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_10_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_5;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_10_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_5;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_10_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_5;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_12_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_6;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_12_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_6;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_12_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_6;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_12_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_6;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_14_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_7;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_14_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_7;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_14_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_7;	// @[regfile.scala:125:50, :145:59, :146:21]
  wire        _bypass_data_WIRE_14_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_7;	// @[regfile.scala:125:50, :145:59, :146:21]
  always @(posedge clock) begin
    read_addrs_0 <= io_read_ports_0_addr;	// @[regfile.scala:125:50]
    read_addrs_1 <= io_read_ports_1_addr;	// @[regfile.scala:125:50]
    read_addrs_2 <= io_read_ports_2_addr;	// @[regfile.scala:125:50]
    read_addrs_3 <= io_read_ports_3_addr;	// @[regfile.scala:125:50]
    read_addrs_4 <= io_read_ports_4_addr;	// @[regfile.scala:125:50]
    read_addrs_5 <= io_read_ports_5_addr;	// @[regfile.scala:125:50]
    read_addrs_6 <= io_read_ports_6_addr;	// @[regfile.scala:125:50]
    read_addrs_7 <= io_read_ports_7_addr;	// @[regfile.scala:125:50]
  end // always @(posedge)
  `ifndef SYNTHESIS
    wire         _T_25 = io_write_ports_0_bits_addr == 7'h0;	// @[regfile.scala:174:45]
    wire         _T_45 = io_write_ports_1_bits_addr == 7'h0;	// @[regfile.scala:174:45]
    always @(posedge clock) begin	// @[regfile.scala:171:15]
      if (~reset & ~(~io_write_ports_0_valid | ~io_write_ports_1_valid | io_write_ports_0_bits_addr != io_write_ports_1_bits_addr | _T_25)) begin	// @[regfile.scala:171:{15,16}, :172:16, :173:{45,78}, :174:45]
        if (`ASSERT_VERBOSE_COND_)	// @[regfile.scala:171:15]
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");	// @[regfile.scala:171:15]
        if (`STOP_COND_)	// @[regfile.scala:171:15]
          $fatal;	// @[regfile.scala:171:15]
      end
      if (~reset & ~(~io_write_ports_0_valid | ~io_write_ports_2_valid | io_write_ports_0_bits_addr != io_write_ports_2_bits_addr | _T_25)) begin	// @[regfile.scala:171:{15,16}, :172:16, :173:{45,78}, :174:45]
        if (`ASSERT_VERBOSE_COND_)	// @[regfile.scala:171:15]
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");	// @[regfile.scala:171:15]
        if (`STOP_COND_)	// @[regfile.scala:171:15]
          $fatal;	// @[regfile.scala:171:15]
      end
      if (~reset & ~(~io_write_ports_0_valid | ~io_write_ports_3_valid | io_write_ports_0_bits_addr != io_write_ports_3_bits_addr | _T_25)) begin	// @[regfile.scala:171:{15,16}, :172:16, :173:{45,78}, :174:45]
        if (`ASSERT_VERBOSE_COND_)	// @[regfile.scala:171:15]
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");	// @[regfile.scala:171:15]
        if (`STOP_COND_)	// @[regfile.scala:171:15]
          $fatal;	// @[regfile.scala:171:15]
      end
      if (~reset & ~(~io_write_ports_1_valid | ~io_write_ports_2_valid | io_write_ports_1_bits_addr != io_write_ports_2_bits_addr | _T_45)) begin	// @[regfile.scala:171:15, :172:16, :173:{45,78}, :174:45]
        if (`ASSERT_VERBOSE_COND_)	// @[regfile.scala:171:15]
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");	// @[regfile.scala:171:15]
        if (`STOP_COND_)	// @[regfile.scala:171:15]
          $fatal;	// @[regfile.scala:171:15]
      end
      if (~reset & ~(~io_write_ports_1_valid | ~io_write_ports_3_valid | io_write_ports_1_bits_addr != io_write_ports_3_bits_addr | _T_45)) begin	// @[regfile.scala:171:15, :172:16, :173:{45,78}, :174:45]
        if (`ASSERT_VERBOSE_COND_)	// @[regfile.scala:171:15]
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");	// @[regfile.scala:171:15]
        if (`STOP_COND_)	// @[regfile.scala:171:15]
          $fatal;	// @[regfile.scala:171:15]
      end
      if (~reset & ~(~io_write_ports_2_valid | ~io_write_ports_3_valid | io_write_ports_2_bits_addr != io_write_ports_3_bits_addr | io_write_ports_2_bits_addr == 7'h0)) begin	// @[regfile.scala:171:15, :172:16, :173:{45,78}, :174:45]
        if (`ASSERT_VERBOSE_COND_)	// @[regfile.scala:171:15]
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");	// @[regfile.scala:171:15]
        if (`STOP_COND_)	// @[regfile.scala:171:15]
          $fatal;	// @[regfile.scala:171:15]
      end
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        read_addrs_0 = _RANDOM_0[6:0];	// @[regfile.scala:125:50]
        read_addrs_1 = _RANDOM_0[13:7];	// @[regfile.scala:125:50]
        read_addrs_2 = _RANDOM_0[20:14];	// @[regfile.scala:125:50]
        read_addrs_3 = _RANDOM_0[27:21];	// @[regfile.scala:125:50]
        read_addrs_4 = {_RANDOM_0[31:28], _RANDOM_1[2:0]};	// @[regfile.scala:125:50]
        read_addrs_5 = _RANDOM_1[9:3];	// @[regfile.scala:125:50]
        read_addrs_6 = _RANDOM_1[16:10];	// @[regfile.scala:125:50]
        read_addrs_7 = _RANDOM_1[23:17];	// @[regfile.scala:125:50]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  regfile_combMem_1 regfile_ext (	// @[regfile.scala:117:20]
    .R0_addr (read_addrs_0),	// @[regfile.scala:125:50]
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R1_addr (read_addrs_1),	// @[regfile.scala:125:50]
    .R1_en   (1'h1),
    .R1_clk  (clock),
    .R2_addr (read_addrs_2),	// @[regfile.scala:125:50]
    .R2_en   (1'h1),
    .R2_clk  (clock),
    .R3_addr (read_addrs_3),	// @[regfile.scala:125:50]
    .R3_en   (1'h1),
    .R3_clk  (clock),
    .R4_addr (read_addrs_4),	// @[regfile.scala:125:50]
    .R4_en   (1'h1),
    .R4_clk  (clock),
    .R5_addr (read_addrs_5),	// @[regfile.scala:125:50]
    .R5_en   (1'h1),
    .R5_clk  (clock),
    .R6_addr (read_addrs_6),	// @[regfile.scala:125:50]
    .R6_en   (1'h1),
    .R6_clk  (clock),
    .R7_addr (read_addrs_7),	// @[regfile.scala:125:50]
    .R7_en   (1'h1),
    .R7_clk  (clock),
    .W0_addr (io_write_ports_0_bits_addr),
    .W0_en   (io_write_ports_0_valid),
    .W0_clk  (clock),
    .W0_data (io_write_ports_0_bits_data),
    .W1_addr (io_write_ports_1_bits_addr),
    .W1_en   (io_write_ports_1_valid),
    .W1_clk  (clock),
    .W1_data (io_write_ports_1_bits_data),
    .W2_addr (io_write_ports_2_bits_addr),
    .W2_en   (io_write_ports_2_valid),
    .W2_clk  (clock),
    .W2_data (io_write_ports_2_bits_data),
    .W3_addr (io_write_ports_3_bits_addr),
    .W3_en   (io_write_ports_3_valid),
    .W3_clk  (clock),
    .W3_data (io_write_ports_3_bits_data),
    .R0_data (_regfile_ext_R0_data),
    .R1_data (_regfile_ext_R1_data),
    .R2_data (_regfile_ext_R2_data),
    .R3_data (_regfile_ext_R3_data),
    .R4_data (_regfile_ext_R4_data),
    .R5_data (_regfile_ext_R5_data),
    .R6_data (_regfile_ext_R6_data),
    .R7_data (_regfile_ext_R7_data)
  );
  assign io_read_ports_0_data = _bypass_data_WIRE_0 | _bypass_data_WIRE_1 | _bypass_data_WIRE_2 | _bypass_data_WIRE_3 ? (_bypass_data_WIRE_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_3 ? io_write_ports_3_bits_data : 64'h0) : _regfile_ext_R0_data;	// @[Mux.scala:27:73, regfile.scala:117:20, :145:59, :150:{35,55}]
  assign io_read_ports_1_data = _bypass_data_WIRE_2_0 | _bypass_data_WIRE_2_1 | _bypass_data_WIRE_2_2 | _bypass_data_WIRE_2_3 ? (_bypass_data_WIRE_2_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_2_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_2_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_2_3 ? io_write_ports_3_bits_data : 64'h0) : _regfile_ext_R1_data;	// @[Mux.scala:27:73, regfile.scala:117:20, :145:59, :150:{35,55}]
  assign io_read_ports_2_data = _bypass_data_WIRE_4_0 | _bypass_data_WIRE_4_1 | _bypass_data_WIRE_4_2 | _bypass_data_WIRE_4_3 ? (_bypass_data_WIRE_4_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_4_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_4_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_4_3 ? io_write_ports_3_bits_data : 64'h0) : _regfile_ext_R2_data;	// @[Mux.scala:27:73, regfile.scala:117:20, :145:59, :150:{35,55}]
  assign io_read_ports_3_data = _bypass_data_WIRE_6_0 | _bypass_data_WIRE_6_1 | _bypass_data_WIRE_6_2 | _bypass_data_WIRE_6_3 ? (_bypass_data_WIRE_6_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_6_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_6_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_6_3 ? io_write_ports_3_bits_data : 64'h0) : _regfile_ext_R3_data;	// @[Mux.scala:27:73, regfile.scala:117:20, :145:59, :150:{35,55}]
  assign io_read_ports_4_data = _bypass_data_WIRE_8_0 | _bypass_data_WIRE_8_1 | _bypass_data_WIRE_8_2 | _bypass_data_WIRE_8_3 ? (_bypass_data_WIRE_8_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_8_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_8_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_8_3 ? io_write_ports_3_bits_data : 64'h0) : _regfile_ext_R4_data;	// @[Mux.scala:27:73, regfile.scala:117:20, :145:59, :150:{35,55}]
  assign io_read_ports_5_data = _bypass_data_WIRE_10_0 | _bypass_data_WIRE_10_1 | _bypass_data_WIRE_10_2 | _bypass_data_WIRE_10_3 ? (_bypass_data_WIRE_10_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_10_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_10_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_10_3 ? io_write_ports_3_bits_data : 64'h0) : _regfile_ext_R5_data;	// @[Mux.scala:27:73, regfile.scala:117:20, :145:59, :150:{35,55}]
  assign io_read_ports_6_data = _bypass_data_WIRE_12_0 | _bypass_data_WIRE_12_1 | _bypass_data_WIRE_12_2 | _bypass_data_WIRE_12_3 ? (_bypass_data_WIRE_12_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_12_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_12_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_12_3 ? io_write_ports_3_bits_data : 64'h0) : _regfile_ext_R6_data;	// @[Mux.scala:27:73, regfile.scala:117:20, :145:59, :150:{35,55}]
  assign io_read_ports_7_data = _bypass_data_WIRE_14_0 | _bypass_data_WIRE_14_1 | _bypass_data_WIRE_14_2 | _bypass_data_WIRE_14_3 ? (_bypass_data_WIRE_14_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_14_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_14_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_14_3 ? io_write_ports_3_bits_data : 64'h0) : _regfile_ext_R7_data;	// @[Mux.scala:27:73, regfile.scala:117:20, :145:59, :150:{35,55}]
endmodule

