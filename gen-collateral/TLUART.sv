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

module TLUART(
  input         clock,
                reset,
                auto_control_xing_in_a_valid,
  input  [2:0]  auto_control_xing_in_a_bits_opcode,
                auto_control_xing_in_a_bits_param,
  input  [1:0]  auto_control_xing_in_a_bits_size,
  input  [11:0] auto_control_xing_in_a_bits_source,
  input  [30:0] auto_control_xing_in_a_bits_address,
  input  [7:0]  auto_control_xing_in_a_bits_mask,
  input  [63:0] auto_control_xing_in_a_bits_data,
  input         auto_control_xing_in_a_bits_corrupt,
                auto_control_xing_in_d_ready,
                auto_io_out_rxd,
  output        auto_int_xing_out_sync_0,
                auto_control_xing_in_a_ready,
                auto_control_xing_in_d_valid,
  output [2:0]  auto_control_xing_in_d_bits_opcode,
  output [1:0]  auto_control_xing_in_d_bits_size,
  output [11:0] auto_control_xing_in_d_bits_source,
  output [63:0] auto_control_xing_in_d_bits_data,
  output        auto_io_out_txd
);

  wire             out_woready_2;	// @[RegisterRouter.scala:83:24]
  wire             _out_wofireMux_T;	// @[RegisterRouter.scala:83:24]
  wire             out_backSel_0;	// @[RegisterRouter.scala:83:24]
  wire             quash;	// @[RegMapFIFO.scala:26:26]
  wire             _rxq_io_enq_ready;	// @[UART.scala:134:19]
  wire             _rxq_io_deq_valid;	// @[UART.scala:134:19]
  wire [7:0]       _rxq_io_deq_bits;	// @[UART.scala:134:19]
  wire [8:0]       _rxq_io_count;	// @[UART.scala:134:19]
  wire             _rxm_io_out_valid;	// @[UART.scala:133:19]
  wire [7:0]       _rxm_io_out_bits;	// @[UART.scala:133:19]
  wire             _txq_io_enq_ready;	// @[UART.scala:131:19]
  wire             _txq_io_deq_valid;	// @[UART.scala:131:19]
  wire [7:0]       _txq_io_deq_bits;	// @[UART.scala:131:19]
  wire [8:0]       _txq_io_count;	// @[UART.scala:131:19]
  wire             _txm_io_in_ready;	// @[UART.scala:130:19]
  reg  [15:0]      div;	// @[UART.scala:136:20]
  reg              txen;	// @[UART.scala:142:21]
  reg              rxen;	// @[UART.scala:143:21]
  reg  [8:0]       txwm;	// @[UART.scala:150:21]
  reg  [8:0]       rxwm;	// @[UART.scala:151:21]
  reg              nstop;	// @[UART.scala:152:22]
  reg              ie_rxwm;	// @[UART.scala:186:19]
  reg              ie_txwm;	// @[UART.scala:186:19]
  wire             ip_txwm = _txq_io_count < txwm;	// @[UART.scala:131:19, :150:21, :189:28]
  wire             ip_rxwm = _rxq_io_count > rxwm;	// @[UART.scala:134:19, :151:21, :190:28]
  wire             out_front_bits_read = auto_control_xing_in_a_bits_opcode == 3'h4;	// @[RegisterRouter.scala:72:36]
  wire             _out_out_bits_data_WIRE_3 = auto_control_xing_in_a_bits_address[11:5] == 7'h0;	// @[Edges.scala:192:34, RegisterRouter.scala:73:19, :83:24]
  assign quash = out_woready_2 & auto_control_xing_in_a_bits_mask[3] & auto_control_xing_in_a_bits_data[31];	// @[Bitwise.scala:28:17, RegMapFIFO.scala:26:26, RegisterRouter.scala:83:24]
  assign out_backSel_0 = auto_control_xing_in_a_bits_address[4:3] == 2'h0;	// @[Cat.scala:33:92, OneHot.scala:57:35, RegisterRouter.scala:83:24]
  assign _out_wofireMux_T = auto_control_xing_in_a_valid & auto_control_xing_in_d_ready;	// @[RegisterRouter.scala:83:24]
  wire             _out_wofireMux_T_2 = _out_wofireMux_T & ~out_front_bits_read;	// @[RegisterRouter.scala:72:36, :83:24]
  assign out_woready_2 = _out_wofireMux_T_2 & out_backSel_0 & _out_out_bits_data_WIRE_3;	// @[RegisterRouter.scala:83:24]
  wire             out_woready_10 = _out_wofireMux_T_2 & auto_control_xing_in_a_bits_address[4:3] == 2'h1 & _out_out_bits_data_WIRE_3;	// @[Cat.scala:33:92, OneHot.scala:57:35, RegisterRouter.scala:83:24]
  wire             out_woready_12 = _out_wofireMux_T_2 & auto_control_xing_in_a_bits_address[4:3] == 2'h2 & _out_out_bits_data_WIRE_3;	// @[Cat.scala:33:92, OneHot.scala:57:35, RegisterRouter.scala:83:24]
  wire [3:0][63:0] _GEN = {{{48'h0, div}}, {{30'h0, ip_rxwm, ip_txwm, 30'h0, ie_rxwm, ie_txwm}}, {{7'h0, rxwm, 15'h0, rxen, 7'h0, txwm, 14'h0, nstop, txen}}, {{~_rxq_io_deq_valid, 23'h0, _rxq_io_deq_bits, ~_txq_io_enq_ready, 31'h0}}};	// @[Bundles.scala:259:74, Cat.scala:33:92, MuxLiteral.scala:49:{10,48}, RegMapFIFO.scala:24:9, :45:21, RegisterRouter.scala:83:24, UART.scala:131:19, :134:19, :136:20, :142:21, :143:21, :150:21, :151:21, :152:22, :186:19, :189:28, :190:28]
  wire [2:0]       x1_3_d_bits_opcode = {2'h0, out_front_bits_read};	// @[OneHot.scala:57:35, RegisterRouter.scala:72:36, :98:19]
  always @(posedge clock) begin
    if (reset) begin
      div <= 16'h21E8;	// @[UART.scala:136:20]
      txen <= 1'h0;	// @[Bundles.scala:259:74, UART.scala:142:21]
      rxen <= 1'h0;	// @[Bundles.scala:259:74, UART.scala:143:21]
      txwm <= 9'h0;	// @[UART.scala:150:21]
      rxwm <= 9'h0;	// @[UART.scala:150:21, :151:21]
      nstop <= 1'h0;	// @[Bundles.scala:259:74, UART.scala:152:22]
      ie_rxwm <= 1'h0;	// @[Bundles.scala:259:74, UART.scala:186:19]
      ie_txwm <= 1'h0;	// @[Bundles.scala:259:74, UART.scala:186:19]
    end
    else begin
      if (_out_wofireMux_T_2 & (&(auto_control_xing_in_a_bits_address[4:3])) & _out_out_bits_data_WIRE_3 & (&{{8{auto_control_xing_in_a_bits_mask[1]}}, {8{auto_control_xing_in_a_bits_mask[0]}}}))	// @[Bitwise.scala:28:17, :77:12, Cat.scala:33:92, RegisterRouter.scala:83:24]
        div <= auto_control_xing_in_a_bits_data[15:0];	// @[RegisterRouter.scala:83:24, UART.scala:136:20]
      if (out_woready_10 & auto_control_xing_in_a_bits_mask[0])	// @[Bitwise.scala:28:17, RegisterRouter.scala:83:24]
        txen <= auto_control_xing_in_a_bits_data[0];	// @[RegisterRouter.scala:83:24, UART.scala:142:21]
      if (out_woready_10 & auto_control_xing_in_a_bits_mask[4])	// @[Bitwise.scala:28:17, RegisterRouter.scala:83:24]
        rxen <= auto_control_xing_in_a_bits_data[32];	// @[RegisterRouter.scala:83:24, UART.scala:143:21]
      if (out_woready_10 & (&{auto_control_xing_in_a_bits_mask[3], {8{auto_control_xing_in_a_bits_mask[2]}}}))	// @[Bitwise.scala:28:17, :77:12, RegisterRouter.scala:83:24]
        txwm <= auto_control_xing_in_a_bits_data[24:16];	// @[RegisterRouter.scala:83:24, UART.scala:150:21]
      if (out_woready_10 & (&{auto_control_xing_in_a_bits_mask[7], {8{auto_control_xing_in_a_bits_mask[6]}}}))	// @[Bitwise.scala:28:17, :77:12, RegisterRouter.scala:83:24]
        rxwm <= auto_control_xing_in_a_bits_data[56:48];	// @[RegisterRouter.scala:83:24, UART.scala:151:21]
      if (out_woready_10 & auto_control_xing_in_a_bits_mask[0])	// @[Bitwise.scala:28:17, RegisterRouter.scala:83:24]
        nstop <= auto_control_xing_in_a_bits_data[1];	// @[RegisterRouter.scala:83:24, UART.scala:152:22]
      if (out_woready_12 & auto_control_xing_in_a_bits_mask[0])	// @[Bitwise.scala:28:17, RegisterRouter.scala:83:24]
        ie_rxwm <= auto_control_xing_in_a_bits_data[1];	// @[RegisterRouter.scala:83:24, UART.scala:186:19]
      if (out_woready_12 & auto_control_xing_in_a_bits_mask[0])	// @[Bitwise.scala:28:17, RegisterRouter.scala:83:24]
        ie_txwm <= auto_control_xing_in_a_bits_data[0];	// @[RegisterRouter.scala:83:24, UART.scala:186:19]
    end
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
        div = _RANDOM_0[15:0];	// @[UART.scala:136:20]
        txen = _RANDOM_0[16];	// @[UART.scala:136:20, :142:21]
        rxen = _RANDOM_0[17];	// @[UART.scala:136:20, :143:21]
        txwm = {_RANDOM_0[31:24], _RANDOM_1[0]};	// @[UART.scala:136:20, :150:21]
        rxwm = _RANDOM_1[9:1];	// @[UART.scala:150:21, :151:21]
        nstop = _RANDOM_1[10];	// @[UART.scala:150:21, :152:22]
        ie_rxwm = _RANDOM_1[12];	// @[UART.scala:150:21, :186:19]
        ie_txwm = _RANDOM_1[13];	// @[UART.scala:150:21, :186:19]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  IntSyncCrossingSource_1 intsource (	// @[Crossing.scala:28:31]
    .clock           (clock),
    .reset           (reset),
    .auto_in_0       (ip_txwm & ie_txwm | ip_rxwm & ie_rxwm),	// @[UART.scala:186:19, :189:28, :190:28, :191:{29,41,53}]
    .auto_out_sync_0 (auto_int_xing_out_sync_0)
  );
  TLMonitor_104 monitor (	// @[Nodes.scala:24:25]
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (auto_control_xing_in_d_ready),
    .io_in_a_valid        (auto_control_xing_in_a_valid),
    .io_in_a_bits_opcode  (auto_control_xing_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_control_xing_in_a_bits_param),
    .io_in_a_bits_size    (auto_control_xing_in_a_bits_size),
    .io_in_a_bits_source  (auto_control_xing_in_a_bits_source),
    .io_in_a_bits_address (auto_control_xing_in_a_bits_address),
    .io_in_a_bits_mask    (auto_control_xing_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_control_xing_in_a_bits_corrupt),
    .io_in_d_ready        (auto_control_xing_in_d_ready),
    .io_in_d_valid        (auto_control_xing_in_a_valid),
    .io_in_d_bits_opcode  (x1_3_d_bits_opcode),	// @[RegisterRouter.scala:98:19]
    .io_in_d_bits_size    (auto_control_xing_in_a_bits_size),
    .io_in_d_bits_source  (auto_control_xing_in_a_bits_source)
  );
  UARTTx txm (	// @[UART.scala:130:19]
    .clock       (clock),
    .reset       (reset),
    .io_en       (txen),	// @[UART.scala:142:21]
    .io_in_valid (_txq_io_deq_valid),	// @[UART.scala:131:19]
    .io_in_bits  (_txq_io_deq_bits),	// @[UART.scala:131:19]
    .io_div      (div),	// @[UART.scala:136:20]
    .io_nstop    (nstop),	// @[UART.scala:152:22]
    .io_in_ready (_txm_io_in_ready),
    .io_out      (auto_io_out_txd)
  );
  Queue_166 txq (	// @[UART.scala:131:19]
    .clock        (clock),
    .reset        (reset),
    .io_enq_valid (out_woready_2 & auto_control_xing_in_a_bits_mask[0] & ~quash),	// @[Bitwise.scala:28:17, RegMapFIFO.scala:18:{30,33}, :26:26, RegisterRouter.scala:83:24]
    .io_enq_bits  (auto_control_xing_in_a_bits_data[7:0]),	// @[RegisterRouter.scala:83:24]
    .io_deq_ready (_txm_io_in_ready),	// @[UART.scala:130:19]
    .io_enq_ready (_txq_io_enq_ready),
    .io_deq_valid (_txq_io_deq_valid),
    .io_deq_bits  (_txq_io_deq_bits),
    .io_count     (_txq_io_count)
  );
  UARTRx rxm (	// @[UART.scala:133:19]
    .clock        (clock),
    .reset        (reset),
    .io_en        (rxen),	// @[UART.scala:143:21]
    .io_in        (auto_io_out_rxd),
    .io_div       (div),	// @[UART.scala:136:20]
    .io_out_valid (_rxm_io_out_valid),
    .io_out_bits  (_rxm_io_out_bits)
  );
  Queue_166 rxq (	// @[UART.scala:134:19]
    .clock        (clock),
    .reset        (reset),
    .io_enq_valid (_rxm_io_out_valid),	// @[UART.scala:133:19]
    .io_enq_bits  (_rxm_io_out_bits),	// @[UART.scala:133:19]
    .io_deq_ready (_out_wofireMux_T & out_front_bits_read & out_backSel_0 & _out_out_bits_data_WIRE_3 & auto_control_xing_in_a_bits_mask[4]),	// @[Bitwise.scala:28:17, RegisterRouter.scala:72:36, :83:24]
    .io_enq_ready (_rxq_io_enq_ready),
    .io_deq_valid (_rxq_io_deq_valid),
    .io_deq_bits  (_rxq_io_deq_bits),
    .io_count     (_rxq_io_count)
  );
  assign auto_control_xing_in_a_ready = auto_control_xing_in_d_ready;
  assign auto_control_xing_in_d_valid = auto_control_xing_in_a_valid;
  assign auto_control_xing_in_d_bits_opcode = x1_3_d_bits_opcode;	// @[RegisterRouter.scala:98:19]
  assign auto_control_xing_in_d_bits_size = auto_control_xing_in_a_bits_size;
  assign auto_control_xing_in_d_bits_source = auto_control_xing_in_a_bits_source;
  assign auto_control_xing_in_d_bits_data = _out_out_bits_data_WIRE_3 ? _GEN[auto_control_xing_in_a_bits_address[4:3]] : 64'h0;	// @[Bundles.scala:259:74, Cat.scala:33:92, MuxLiteral.scala:49:10, RegisterRouter.scala:83:24]
endmodule

