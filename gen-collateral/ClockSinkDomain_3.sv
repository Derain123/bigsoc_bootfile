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

module ClockSinkDomain_3(
  input         auto_reset_setter_clock_in_member_allClocks_uncore_clock,
                auto_reset_setter_clock_in_member_allClocks_uncore_reset,
                auto_xbar_in_a_valid,
  input  [2:0]  auto_xbar_in_a_bits_opcode,
                auto_xbar_in_a_bits_param,
  input  [1:0]  auto_xbar_in_a_bits_size,
  input  [11:0] auto_xbar_in_a_bits_source,
  input  [20:0] auto_xbar_in_a_bits_address,
  input  [7:0]  auto_xbar_in_a_bits_mask,
  input  [63:0] auto_xbar_in_a_bits_data,
  input         auto_xbar_in_a_bits_corrupt,
                auto_xbar_in_d_ready,
                auto_clock_in_clock,
                auto_clock_in_reset,
  output        auto_resetSynchronizer_out_member_allClocks_uncore_clock,
                auto_resetSynchronizer_out_member_allClocks_uncore_reset,
                auto_xbar_in_a_ready,
                auto_xbar_in_d_valid,
  output [2:0]  auto_xbar_in_d_bits_opcode,
  output [1:0]  auto_xbar_in_d_bits_size,
  output [11:0] auto_xbar_in_d_bits_source,
  output [63:0] auto_xbar_in_d_bits_data
);

  wire        _reset_setter_auto_clock_out_member_allClocks_uncore_clock;	// @[HasChipyardPRCI.scala:89:34]
  wire        _reset_setter_auto_clock_out_member_allClocks_uncore_reset;	// @[HasChipyardPRCI.scala:89:34]
  wire        _reset_setter_auto_tl_in_a_ready;	// @[HasChipyardPRCI.scala:89:34]
  wire        _reset_setter_auto_tl_in_d_valid;	// @[HasChipyardPRCI.scala:89:34]
  wire [2:0]  _reset_setter_auto_tl_in_d_bits_opcode;	// @[HasChipyardPRCI.scala:89:34]
  wire [1:0]  _reset_setter_auto_tl_in_d_bits_size;	// @[HasChipyardPRCI.scala:89:34]
  wire [11:0] _reset_setter_auto_tl_in_d_bits_source;	// @[HasChipyardPRCI.scala:89:34]
  wire [63:0] _reset_setter_auto_tl_in_d_bits_data;	// @[HasChipyardPRCI.scala:89:34]
  wire        _clock_gater_auto_clock_gater_in_1_a_ready;	// @[HasChipyardPRCI.scala:84:33]
  wire        _clock_gater_auto_clock_gater_in_1_d_valid;	// @[HasChipyardPRCI.scala:84:33]
  wire [2:0]  _clock_gater_auto_clock_gater_in_1_d_bits_opcode;	// @[HasChipyardPRCI.scala:84:33]
  wire [1:0]  _clock_gater_auto_clock_gater_in_1_d_bits_size;	// @[HasChipyardPRCI.scala:84:33]
  wire [11:0] _clock_gater_auto_clock_gater_in_1_d_bits_source;	// @[HasChipyardPRCI.scala:84:33]
  wire [63:0] _clock_gater_auto_clock_gater_in_1_d_bits_data;	// @[HasChipyardPRCI.scala:84:33]
  wire        _clock_gater_auto_clock_gater_out_member_allClocks_uncore_clock;	// @[HasChipyardPRCI.scala:84:33]
  wire        _clock_gater_auto_clock_gater_out_member_allClocks_uncore_reset;	// @[HasChipyardPRCI.scala:84:33]
  wire        _xbar_auto_out_1_a_valid;	// @[Xbar.scala:145:26]
  wire [2:0]  _xbar_auto_out_1_a_bits_opcode;	// @[Xbar.scala:145:26]
  wire [2:0]  _xbar_auto_out_1_a_bits_param;	// @[Xbar.scala:145:26]
  wire [1:0]  _xbar_auto_out_1_a_bits_size;	// @[Xbar.scala:145:26]
  wire [11:0] _xbar_auto_out_1_a_bits_source;	// @[Xbar.scala:145:26]
  wire [20:0] _xbar_auto_out_1_a_bits_address;	// @[Xbar.scala:145:26]
  wire [7:0]  _xbar_auto_out_1_a_bits_mask;	// @[Xbar.scala:145:26]
  wire        _xbar_auto_out_1_a_bits_corrupt;	// @[Xbar.scala:145:26]
  wire        _xbar_auto_out_1_d_ready;	// @[Xbar.scala:145:26]
  wire        _xbar_auto_out_0_a_valid;	// @[Xbar.scala:145:26]
  wire [2:0]  _xbar_auto_out_0_a_bits_opcode;	// @[Xbar.scala:145:26]
  wire [2:0]  _xbar_auto_out_0_a_bits_param;	// @[Xbar.scala:145:26]
  wire [1:0]  _xbar_auto_out_0_a_bits_size;	// @[Xbar.scala:145:26]
  wire [11:0] _xbar_auto_out_0_a_bits_source;	// @[Xbar.scala:145:26]
  wire [20:0] _xbar_auto_out_0_a_bits_address;	// @[Xbar.scala:145:26]
  wire [7:0]  _xbar_auto_out_0_a_bits_mask;	// @[Xbar.scala:145:26]
  wire [63:0] _xbar_auto_out_0_a_bits_data;	// @[Xbar.scala:145:26]
  wire        _xbar_auto_out_0_a_bits_corrupt;	// @[Xbar.scala:145:26]
  wire        _xbar_auto_out_0_d_ready;	// @[Xbar.scala:145:26]
  TLXbar_31 xbar (	// @[Xbar.scala:145:26]
    .clock                     (auto_clock_in_clock),
    .reset                     (auto_clock_in_reset),
    .auto_in_a_valid           (auto_xbar_in_a_valid),
    .auto_in_a_bits_opcode     (auto_xbar_in_a_bits_opcode),
    .auto_in_a_bits_param      (auto_xbar_in_a_bits_param),
    .auto_in_a_bits_size       (auto_xbar_in_a_bits_size),
    .auto_in_a_bits_source     (auto_xbar_in_a_bits_source),
    .auto_in_a_bits_address    (auto_xbar_in_a_bits_address),
    .auto_in_a_bits_mask       (auto_xbar_in_a_bits_mask),
    .auto_in_a_bits_data       (auto_xbar_in_a_bits_data),
    .auto_in_a_bits_corrupt    (auto_xbar_in_a_bits_corrupt),
    .auto_in_d_ready           (auto_xbar_in_d_ready),
    .auto_out_1_a_ready        (_reset_setter_auto_tl_in_a_ready),	// @[HasChipyardPRCI.scala:89:34]
    .auto_out_1_d_valid        (_reset_setter_auto_tl_in_d_valid),	// @[HasChipyardPRCI.scala:89:34]
    .auto_out_1_d_bits_opcode  (_reset_setter_auto_tl_in_d_bits_opcode),	// @[HasChipyardPRCI.scala:89:34]
    .auto_out_1_d_bits_size    (_reset_setter_auto_tl_in_d_bits_size),	// @[HasChipyardPRCI.scala:89:34]
    .auto_out_1_d_bits_source  (_reset_setter_auto_tl_in_d_bits_source),	// @[HasChipyardPRCI.scala:89:34]
    .auto_out_1_d_bits_data    (_reset_setter_auto_tl_in_d_bits_data),	// @[HasChipyardPRCI.scala:89:34]
    .auto_out_0_a_ready        (_clock_gater_auto_clock_gater_in_1_a_ready),	// @[HasChipyardPRCI.scala:84:33]
    .auto_out_0_d_valid        (_clock_gater_auto_clock_gater_in_1_d_valid),	// @[HasChipyardPRCI.scala:84:33]
    .auto_out_0_d_bits_opcode  (_clock_gater_auto_clock_gater_in_1_d_bits_opcode),	// @[HasChipyardPRCI.scala:84:33]
    .auto_out_0_d_bits_size    (_clock_gater_auto_clock_gater_in_1_d_bits_size),	// @[HasChipyardPRCI.scala:84:33]
    .auto_out_0_d_bits_source  (_clock_gater_auto_clock_gater_in_1_d_bits_source),	// @[HasChipyardPRCI.scala:84:33]
    .auto_out_0_d_bits_data    (_clock_gater_auto_clock_gater_in_1_d_bits_data),	// @[HasChipyardPRCI.scala:84:33]
    .auto_in_a_ready           (auto_xbar_in_a_ready),
    .auto_in_d_valid           (auto_xbar_in_d_valid),
    .auto_in_d_bits_opcode     (auto_xbar_in_d_bits_opcode),
    .auto_in_d_bits_size       (auto_xbar_in_d_bits_size),
    .auto_in_d_bits_source     (auto_xbar_in_d_bits_source),
    .auto_in_d_bits_data       (auto_xbar_in_d_bits_data),
    .auto_out_1_a_valid        (_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode  (_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param   (_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size    (_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source  (_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address (_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask    (_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_corrupt (_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready        (_xbar_auto_out_1_d_ready),
    .auto_out_0_a_valid        (_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode  (_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param   (_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size    (_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source  (_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address (_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask    (_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data    (_xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt (_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready        (_xbar_auto_out_0_d_ready)
  );
  ClockGroupResetSynchronizer resetSynchronizer (	// @[ResetSynchronizer.scala:44:69]
    .auto_in_member_allClocks_uncore_clock  (_clock_gater_auto_clock_gater_out_member_allClocks_uncore_clock),	// @[HasChipyardPRCI.scala:84:33]
    .auto_in_member_allClocks_uncore_reset  (_clock_gater_auto_clock_gater_out_member_allClocks_uncore_reset),	// @[HasChipyardPRCI.scala:84:33]
    .auto_out_member_allClocks_uncore_clock (auto_resetSynchronizer_out_member_allClocks_uncore_clock),
    .auto_out_member_allClocks_uncore_reset (auto_resetSynchronizer_out_member_allClocks_uncore_reset)
  );
  TileClockGater clock_gater (	// @[HasChipyardPRCI.scala:84:33]
    .clock                                               (auto_clock_in_clock),
    .reset                                               (auto_clock_in_reset),
    .auto_clock_gater_in_1_a_valid                       (_xbar_auto_out_0_a_valid),	// @[Xbar.scala:145:26]
    .auto_clock_gater_in_1_a_bits_opcode                 (_xbar_auto_out_0_a_bits_opcode),	// @[Xbar.scala:145:26]
    .auto_clock_gater_in_1_a_bits_param                  (_xbar_auto_out_0_a_bits_param),	// @[Xbar.scala:145:26]
    .auto_clock_gater_in_1_a_bits_size                   (_xbar_auto_out_0_a_bits_size),	// @[Xbar.scala:145:26]
    .auto_clock_gater_in_1_a_bits_source                 (_xbar_auto_out_0_a_bits_source),	// @[Xbar.scala:145:26]
    .auto_clock_gater_in_1_a_bits_address                (_xbar_auto_out_0_a_bits_address),	// @[Xbar.scala:145:26]
    .auto_clock_gater_in_1_a_bits_mask                   (_xbar_auto_out_0_a_bits_mask),	// @[Xbar.scala:145:26]
    .auto_clock_gater_in_1_a_bits_data                   (_xbar_auto_out_0_a_bits_data),	// @[Xbar.scala:145:26]
    .auto_clock_gater_in_1_a_bits_corrupt                (_xbar_auto_out_0_a_bits_corrupt),	// @[Xbar.scala:145:26]
    .auto_clock_gater_in_1_d_ready                       (_xbar_auto_out_0_d_ready),	// @[Xbar.scala:145:26]
    .auto_clock_gater_in_0_member_allClocks_uncore_clock (_reset_setter_auto_clock_out_member_allClocks_uncore_clock),	// @[HasChipyardPRCI.scala:89:34]
    .auto_clock_gater_in_0_member_allClocks_uncore_reset (_reset_setter_auto_clock_out_member_allClocks_uncore_reset),	// @[HasChipyardPRCI.scala:89:34]
    .auto_clock_gater_in_1_a_ready                       (_clock_gater_auto_clock_gater_in_1_a_ready),
    .auto_clock_gater_in_1_d_valid                       (_clock_gater_auto_clock_gater_in_1_d_valid),
    .auto_clock_gater_in_1_d_bits_opcode                 (_clock_gater_auto_clock_gater_in_1_d_bits_opcode),
    .auto_clock_gater_in_1_d_bits_size                   (_clock_gater_auto_clock_gater_in_1_d_bits_size),
    .auto_clock_gater_in_1_d_bits_source                 (_clock_gater_auto_clock_gater_in_1_d_bits_source),
    .auto_clock_gater_in_1_d_bits_data                   (_clock_gater_auto_clock_gater_in_1_d_bits_data),
    .auto_clock_gater_out_member_allClocks_uncore_clock  (_clock_gater_auto_clock_gater_out_member_allClocks_uncore_clock),
    .auto_clock_gater_out_member_allClocks_uncore_reset  (_clock_gater_auto_clock_gater_out_member_allClocks_uncore_reset)
  );
  TileResetSetter reset_setter (	// @[HasChipyardPRCI.scala:89:34]
    .clock                                        (auto_clock_in_clock),
    .reset                                        (auto_clock_in_reset),
    .auto_clock_in_member_allClocks_uncore_clock  (auto_reset_setter_clock_in_member_allClocks_uncore_clock),
    .auto_clock_in_member_allClocks_uncore_reset  (auto_reset_setter_clock_in_member_allClocks_uncore_reset),
    .auto_tl_in_a_valid                           (_xbar_auto_out_1_a_valid),	// @[Xbar.scala:145:26]
    .auto_tl_in_a_bits_opcode                     (_xbar_auto_out_1_a_bits_opcode),	// @[Xbar.scala:145:26]
    .auto_tl_in_a_bits_param                      (_xbar_auto_out_1_a_bits_param),	// @[Xbar.scala:145:26]
    .auto_tl_in_a_bits_size                       (_xbar_auto_out_1_a_bits_size),	// @[Xbar.scala:145:26]
    .auto_tl_in_a_bits_source                     (_xbar_auto_out_1_a_bits_source),	// @[Xbar.scala:145:26]
    .auto_tl_in_a_bits_address                    (_xbar_auto_out_1_a_bits_address),	// @[Xbar.scala:145:26]
    .auto_tl_in_a_bits_mask                       (_xbar_auto_out_1_a_bits_mask),	// @[Xbar.scala:145:26]
    .auto_tl_in_a_bits_corrupt                    (_xbar_auto_out_1_a_bits_corrupt),	// @[Xbar.scala:145:26]
    .auto_tl_in_d_ready                           (_xbar_auto_out_1_d_ready),	// @[Xbar.scala:145:26]
    .auto_clock_out_member_allClocks_uncore_clock (_reset_setter_auto_clock_out_member_allClocks_uncore_clock),
    .auto_clock_out_member_allClocks_uncore_reset (_reset_setter_auto_clock_out_member_allClocks_uncore_reset),
    .auto_tl_in_a_ready                           (_reset_setter_auto_tl_in_a_ready),
    .auto_tl_in_d_valid                           (_reset_setter_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode                     (_reset_setter_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size                       (_reset_setter_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source                     (_reset_setter_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data                       (_reset_setter_auto_tl_in_d_bits_data)
  );
endmodule

