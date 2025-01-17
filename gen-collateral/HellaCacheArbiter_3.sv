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

module HellaCacheArbiter_3(
  input         clock,
                io_requestor_0_req_valid,
  input  [39:0] io_requestor_0_req_bits_addr,
  input         io_requestor_0_s1_kill,
                io_requestor_1_req_valid,
  input  [39:0] io_requestor_1_req_bits_addr,
  input  [6:0]  io_requestor_1_req_bits_tag,
  input  [4:0]  io_requestor_1_req_bits_cmd,
  input  [1:0]  io_requestor_1_req_bits_size,
  input         io_requestor_1_req_bits_signed,
  input  [1:0]  io_requestor_1_req_bits_dprv,
  input         io_requestor_1_s1_kill,
  input  [63:0] io_requestor_1_s1_data_data,
  input         io_mem_req_ready,
                io_mem_s2_nack,
                io_mem_resp_valid,
  input  [6:0]  io_mem_resp_bits_tag,
  input  [1:0]  io_mem_resp_bits_size,
  input  [63:0] io_mem_resp_bits_data,
  input         io_mem_resp_bits_replay,
                io_mem_resp_bits_has_data,
  input  [63:0] io_mem_resp_bits_data_word_bypass,
  input         io_mem_replay_next,
                io_mem_s2_xcpt_ma_ld,
                io_mem_s2_xcpt_ma_st,
                io_mem_s2_xcpt_pf_ld,
                io_mem_s2_xcpt_pf_st,
                io_mem_s2_xcpt_gf_ld,
                io_mem_s2_xcpt_gf_st,
                io_mem_s2_xcpt_ae_ld,
                io_mem_s2_xcpt_ae_st,
                io_mem_ordered,
                io_mem_perf_release,
  output        io_requestor_0_req_ready,
                io_requestor_0_s2_nack,
                io_requestor_0_resp_valid,
  output [63:0] io_requestor_0_resp_bits_data,
  output        io_requestor_0_s2_xcpt_ae_ld,
                io_requestor_1_req_ready,
                io_requestor_1_s2_nack,
                io_requestor_1_resp_valid,
  output [6:0]  io_requestor_1_resp_bits_tag,
  output [1:0]  io_requestor_1_resp_bits_size,
  output [63:0] io_requestor_1_resp_bits_data,
  output        io_requestor_1_resp_bits_replay,
                io_requestor_1_resp_bits_has_data,
  output [63:0] io_requestor_1_resp_bits_data_word_bypass,
  output        io_requestor_1_replay_next,
                io_requestor_1_s2_xcpt_ma_ld,
                io_requestor_1_s2_xcpt_ma_st,
                io_requestor_1_s2_xcpt_pf_ld,
                io_requestor_1_s2_xcpt_pf_st,
                io_requestor_1_s2_xcpt_gf_ld,
                io_requestor_1_s2_xcpt_gf_st,
                io_requestor_1_s2_xcpt_ae_ld,
                io_requestor_1_s2_xcpt_ae_st,
                io_requestor_1_ordered,
                io_requestor_1_perf_release,
                io_mem_req_valid,
  output [39:0] io_mem_req_bits_addr,
  output [6:0]  io_mem_req_bits_tag,
  output [4:0]  io_mem_req_bits_cmd,
  output [1:0]  io_mem_req_bits_size,
  output        io_mem_req_bits_signed,
  output [1:0]  io_mem_req_bits_dprv,
  output        io_mem_req_bits_phys,
                io_mem_s1_kill,
  output [63:0] io_mem_s1_data_data
);

  reg s1_id;	// @[HellaCacheArbiter.scala:20:20]
  reg s2_id;	// @[HellaCacheArbiter.scala:21:24]
  always @(posedge clock) begin
    if (io_requestor_0_req_valid)
      s1_id <= 1'h0;	// @[HellaCacheArbiter.scala:20:20]
    else
      s1_id <= 1'h1;	// @[HellaCacheArbiter.scala:20:20]
    s2_id <= s1_id;	// @[HellaCacheArbiter.scala:20:20, :21:24]
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        s1_id = _RANDOM_0[0];	// @[HellaCacheArbiter.scala:20:20]
        s2_id = _RANDOM_0[1];	// @[HellaCacheArbiter.scala:20:20, :21:24]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_requestor_0_req_ready = io_mem_req_ready;
  assign io_requestor_0_s2_nack = io_mem_s2_nack & ~s2_id;	// @[HellaCacheArbiter.scala:21:24, :53:21, :68:49]
  assign io_requestor_0_resp_valid = io_mem_resp_valid & ~(io_mem_resp_bits_tag[0]);	// @[HellaCacheArbiter.scala:61:{41,57}, :62:39]
  assign io_requestor_0_resp_bits_data = io_mem_resp_bits_data;
  assign io_requestor_0_s2_xcpt_ae_ld = io_mem_s2_xcpt_ae_ld;
  assign io_requestor_1_req_ready = io_mem_req_ready & ~io_requestor_0_req_valid;	// @[HellaCacheArbiter.scala:28:{64,67}]
  assign io_requestor_1_s2_nack = io_mem_s2_nack & s2_id;	// @[HellaCacheArbiter.scala:21:24, :68:49]
  assign io_requestor_1_resp_valid = io_mem_resp_valid & io_mem_resp_bits_tag[0];	// @[HellaCacheArbiter.scala:61:41, :62:39]
  assign io_requestor_1_resp_bits_tag = {1'h0, io_mem_resp_bits_tag[6:1]};	// @[HellaCacheArbiter.scala:74:{21,45}]
  assign io_requestor_1_resp_bits_size = io_mem_resp_bits_size;
  assign io_requestor_1_resp_bits_data = io_mem_resp_bits_data;
  assign io_requestor_1_resp_bits_replay = io_mem_resp_bits_replay;
  assign io_requestor_1_resp_bits_has_data = io_mem_resp_bits_has_data;
  assign io_requestor_1_resp_bits_data_word_bypass = io_mem_resp_bits_data_word_bypass;
  assign io_requestor_1_replay_next = io_mem_replay_next;
  assign io_requestor_1_s2_xcpt_ma_ld = io_mem_s2_xcpt_ma_ld;
  assign io_requestor_1_s2_xcpt_ma_st = io_mem_s2_xcpt_ma_st;
  assign io_requestor_1_s2_xcpt_pf_ld = io_mem_s2_xcpt_pf_ld;
  assign io_requestor_1_s2_xcpt_pf_st = io_mem_s2_xcpt_pf_st;
  assign io_requestor_1_s2_xcpt_gf_ld = io_mem_s2_xcpt_gf_ld;
  assign io_requestor_1_s2_xcpt_gf_st = io_mem_s2_xcpt_gf_st;
  assign io_requestor_1_s2_xcpt_ae_ld = io_mem_s2_xcpt_ae_ld;
  assign io_requestor_1_s2_xcpt_ae_st = io_mem_s2_xcpt_ae_st;
  assign io_requestor_1_ordered = io_mem_ordered;
  assign io_requestor_1_perf_release = io_mem_perf_release;
  assign io_mem_req_valid = io_requestor_0_req_valid | io_requestor_1_req_valid;	// @[HellaCacheArbiter.scala:25:63]
  assign io_mem_req_bits_addr = io_requestor_0_req_valid ? io_requestor_0_req_bits_addr : io_requestor_1_req_bits_addr;	// @[HellaCacheArbiter.scala:33:25, :51:26]
  assign io_mem_req_bits_tag = io_requestor_0_req_valid ? 7'h0 : {io_requestor_1_req_bits_tag[5:0], 1'h1};	// @[HellaCacheArbiter.scala:34:29, :51:26]
  assign io_mem_req_bits_cmd = io_requestor_0_req_valid ? 5'h0 : io_requestor_1_req_bits_cmd;	// @[HellaCacheArbiter.scala:33:25, :51:26]
  assign io_mem_req_bits_size = io_requestor_0_req_valid ? 2'h3 : io_requestor_1_req_bits_size;	// @[HellaCacheArbiter.scala:33:25, :51:26]
  assign io_mem_req_bits_signed = ~io_requestor_0_req_valid & io_requestor_1_req_bits_signed;	// @[HellaCacheArbiter.scala:33:25, :51:26]
  assign io_mem_req_bits_dprv = io_requestor_0_req_valid ? 2'h1 : io_requestor_1_req_bits_dprv;	// @[HellaCacheArbiter.scala:33:25, :51:26]
  assign io_mem_req_bits_phys = io_requestor_0_req_valid;
  assign io_mem_s1_kill = s1_id ? io_requestor_1_s1_kill : io_requestor_0_s1_kill;	// @[HellaCacheArbiter.scala:20:20, :39:24, :52:30]
  assign io_mem_s1_data_data = s1_id ? io_requestor_1_s1_data_data : 64'h0;	// @[HellaCacheArbiter.scala:20:20, :40:24, :52:30]
endmodule

