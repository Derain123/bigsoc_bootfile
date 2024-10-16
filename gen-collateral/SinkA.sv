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

module SinkA(
  input          clock,
                 reset,
                 io_req_ready,
                 io_a_valid,
  input  [2:0]   io_a_bits_opcode,
                 io_a_bits_param,
                 io_a_bits_size,
  input  [6:0]   io_a_bits_source,
  input  [31:0]  io_a_bits_address,
  input  [15:0]  io_a_bits_mask,
  input  [127:0] io_a_bits_data,
  input          io_a_bits_corrupt,
                 io_pb_pop_valid,
  input  [5:0]   io_pb_pop_bits_index,
  input          io_pb_pop_bits_last,
  output         io_req_valid,
  output [2:0]   io_req_bits_opcode,
                 io_req_bits_param,
                 io_req_bits_size,
  output [6:0]   io_req_bits_source,
  output [17:0]  io_req_bits_tag,
  output [5:0]   io_req_bits_offset,
                 io_req_bits_put,
  output [3:0]   io_req_bits_set,
  output         io_a_ready,
                 io_pb_pop_ready,
  output [127:0] io_pb_beat_data,
  output [15:0]  io_pb_beat_mask,
  output         io_pb_beat_corrupt
);

  wire        _io_pb_pop_ready_output;	// @[SinkA.scala:105:40]
  wire        _putbuffer_io_push_ready;	// @[SinkA.scala:51:25]
  wire [39:0] _putbuffer_io_valid;	// @[SinkA.scala:51:25]
  reg  [39:0] lists;	// @[SinkA.scala:52:22]
  wire [39:0] _freeOH_T_22 = ~lists;	// @[SinkA.scala:52:22, :59:25]
  wire [39:0] _freeOH_T_3 = _freeOH_T_22 | {_freeOH_T_22[38:0], 1'h0};	// @[SinkA.scala:59:25, package.scala:245:{43,48,53}]
  wire [39:0] _freeOH_T_6 = _freeOH_T_3 | {_freeOH_T_3[37:0], 2'h0};	// @[Edges.scala:229:27, package.scala:245:{43,53}]
  wire [39:0] _freeOH_T_9 = _freeOH_T_6 | {_freeOH_T_6[35:0], 4'h0};	// @[package.scala:245:{43,48,53}]
  wire [39:0] _freeOH_T_12 = _freeOH_T_9 | {_freeOH_T_9[31:0], 8'h0};	// @[package.scala:245:{43,48,53}]
  wire [39:0] _freeOH_T_15 = _freeOH_T_12 | {_freeOH_T_12[23:0], 16'h0};	// @[package.scala:245:{43,48,53}]
  wire [40:0] freeOH = {~(_freeOH_T_15 | {_freeOH_T_15[7:0], 32'h0}), 1'h1} & {1'h0, _freeOH_T_22};	// @[Edges.scala:230:28, SinkA.scala:59:{16,25,33,39}, package.scala:245:{43,48,53}]
  wire [30:0] _GEN = {23'h0, freeOH[40:33]} | freeOH[31:1];	// @[OneHot.scala:31:18, :32:28, SinkA.scala:59:39]
  wire [14:0] _GEN_0 = _GEN[30:16] | _GEN[14:0];	// @[OneHot.scala:30:18, :31:18, :32:28]
  wire [6:0]  _GEN_1 = _GEN_0[14:8] | _GEN_0[6:0];	// @[OneHot.scala:30:18, :31:18, :32:28]
  wire [2:0]  _GEN_2 = _GEN_1[6:4] | _GEN_1[2:0];	// @[OneHot.scala:30:18, :31:18, :32:28]
  wire [5:0]  freeIdx = {|(freeOH[40:32]), |(_GEN[30:15]), |(_GEN_0[14:7]), |(_GEN_1[6:3]), |(_GEN_2[2:1]), _GEN_2[2] | _GEN_2[0]};	// @[Cat.scala:33:92, OneHot.scala:30:18, :31:18, :32:{14,28}, SinkA.scala:59:39]
  reg  [1:0]  first_counter;	// @[Edges.scala:229:27]
  wire        first = first_counter == 2'h0;	// @[Edges.scala:229:27, :231:25]
  wire        req_block = first & ~io_req_ready;	// @[Edges.scala:231:25, SinkA.scala:70:{25,28}]
  wire        buf_block = ~(io_a_bits_opcode[2]) & ~_putbuffer_io_push_ready;	// @[Edges.scala:92:{28,37}, SinkA.scala:51:25, :71:{27,30}]
  wire        set_block = ~(io_a_bits_opcode[2]) & first & (&lists);	// @[Edges.scala:92:{28,37}, :231:25, SinkA.scala:52:22, :58:21, :72:36]
  wire        _io_a_ready_output = ~req_block & ~buf_block & ~set_block;	// @[SinkA.scala:70:25, :71:27, :72:36, :78:{14,28,39,42}]
  wire        _T_3 = io_a_valid & first;	// @[Edges.scala:231:25, SinkA.scala:79:27]
  reg  [5:0]  put_r;	// @[Reg.scala:19:16]
  wire [5:0]  put = first ? freeIdx : put_r;	// @[Cat.scala:33:92, Edges.scala:231:25, Reg.scala:19:16, SinkA.scala:84:16]
  wire        _T_9 = _io_pb_pop_ready_output & io_pb_pop_valid;	// @[Decoupled.scala:51:35, SinkA.scala:105:40]
  wire [39:0] _io_pb_pop_ready_T = _putbuffer_io_valid >> io_pb_pop_bits_index;	// @[SinkA.scala:51:25, :105:40]
  assign _io_pb_pop_ready_output = _io_pb_pop_ready_T[0];	// @[SinkA.scala:105:40]
  wire [63:0] _lists_clr_T = 64'h1 << io_pb_pop_bits_index;	// @[OneHot.scala:64:12]
  wire [12:0] _first_beats1_decode_T_1 = 13'h3F << io_a_bits_size;	// @[package.scala:235:71]
  always @(posedge clock) begin
    if (reset) begin
      lists <= 40'h0;	// @[SinkA.scala:52:22]
      first_counter <= 2'h0;	// @[Edges.scala:229:27]
    end
    else begin
      lists <= (lists | (_T_3 & ~(io_a_bits_opcode[2]) & ~req_block & ~buf_block ? freeOH[39:0] : 40'h0)) & ~(_T_9 & io_pb_pop_bits_last ? _lists_clr_T[39:0] : 40'h0);	// @[Decoupled.scala:51:35, Edges.scala:92:{28,37}, OneHot.scala:64:{12,27}, SinkA.scala:52:22, :54:27, :55:27, :56:{19,32,34}, :59:39, :70:25, :71:27, :78:{14,28}, :79:27, :81:{51,66,78}, :108:{24,48}, :109:15]
      if (_io_a_ready_output & io_a_valid) begin	// @[Decoupled.scala:51:35, SinkA.scala:78:39]
        if (first) begin	// @[Edges.scala:231:25]
          if (io_a_bits_opcode[2])	// @[Edges.scala:92:37]
            first_counter <= 2'h0;	// @[Edges.scala:229:27]
          else	// @[Edges.scala:92:37]
            first_counter <= ~(_first_beats1_decode_T_1[5:4]);	// @[Edges.scala:229:27, package.scala:235:{46,71,76}]
        end
        else	// @[Edges.scala:231:25]
          first_counter <= first_counter - 2'h1;	// @[Edges.scala:229:27, :230:28]
      end
    end
    if (first)	// @[Edges.scala:231:25]
      put_r <= freeIdx;	// @[Cat.scala:33:92, Reg.scala:19:16]
  end // always @(posedge)
  `ifndef SYNTHESIS
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
        lists = {_RANDOM_0, _RANDOM_1[7:0]};	// @[SinkA.scala:52:22]
        first_counter = _RANDOM_1[9:8];	// @[Edges.scala:229:27, SinkA.scala:52:22]
        put_r = _RANDOM_1[15:10];	// @[Reg.scala:19:16, SinkA.scala:52:22]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  ListBuffer putbuffer (	// @[SinkA.scala:51:25]
    .clock                     (clock),
    .reset                     (reset),
    .io_push_valid             (io_a_valid & ~(io_a_bits_opcode[2]) & ~req_block & ~set_block),	// @[Edges.scala:92:{28,37}, SinkA.scala:70:25, :72:36, :78:{14,42}, :80:63]
    .io_push_bits_index        (put),	// @[SinkA.scala:84:16]
    .io_push_bits_data_data    (io_a_bits_data),
    .io_push_bits_data_mask    (io_a_bits_mask),
    .io_push_bits_data_corrupt (io_a_bits_corrupt),
    .io_pop_valid              (_T_9),	// @[Decoupled.scala:51:35]
    .io_pop_bits               (io_pb_pop_bits_index),
    .io_push_ready             (_putbuffer_io_push_ready),
    .io_valid                  (_putbuffer_io_valid),
    .io_data_data              (io_pb_beat_data),
    .io_data_mask              (io_pb_beat_mask),
    .io_data_corrupt           (io_pb_beat_corrupt)
  );
  assign io_req_valid = _T_3 & ~buf_block & ~set_block;	// @[SinkA.scala:71:27, :72:36, :78:{28,42}, :79:{27,50}]
  assign io_req_bits_opcode = io_a_bits_opcode;
  assign io_req_bits_param = io_a_bits_param;
  assign io_req_bits_size = io_a_bits_size;
  assign io_req_bits_source = io_a_bits_source;
  assign io_req_bits_tag = io_a_bits_address[27:10];	// @[Cat.scala:33:92, Parameters.scala:214:22, :215:19]
  assign io_req_bits_offset = io_a_bits_address[5:0];	// @[Cat.scala:33:92, Parameters.scala:216:50]
  assign io_req_bits_put = put;	// @[SinkA.scala:84:16]
  assign io_req_bits_set = io_a_bits_address[9:6];	// @[Cat.scala:33:92, Parameters.scala:214:22, :216:28]
  assign io_a_ready = _io_a_ready_output;	// @[SinkA.scala:78:39]
  assign io_pb_pop_ready = _io_pb_pop_ready_output;	// @[SinkA.scala:105:40]
endmodule

