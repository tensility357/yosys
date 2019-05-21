module abc9_test001(input a, output o);
assign o = a;
endmodule

module abc9_test002(input [1:0] a, output o);
assign o = a[1];
endmodule

module abc9_test003(input [1:0] a, output [1:0] o);
assign o = a;
endmodule

module abc9_test004(input [1:0] a, output o);
assign o = ^a;
endmodule

module abc9_test005(input [1:0] a, output o, output p);
assign o = ^a;
assign p = ~o;
endmodule

module abc9_test006(input [1:0] a, output [2:0] o);
assign o[0] = ^a;
assign o[1] = ~o[0];
assign o[2] = o[1];
endmodule

module abc9_test007(input a, output o);
wire b, c;
assign c = ~a;
assign b = c;
abc9_test007_sub s(b, o);
endmodule

module abc9_test007_sub(input a, output b);
assign b = a;
endmodule

module abc9_test008(input a, output o);
wire b, c;
assign b = ~a;
assign c = b;
abc9_test008_sub s(b, o);
endmodule

module abc9_test008_sub(input a, output b);
assign b = ~a;
endmodule

module abc9_test009(inout io, input oe);
reg latch;
always @(io or oe)
    if (!oe)
        latch <= io;
assign io = oe ? ~latch : 1'bz;
endmodule

module abc9_test010(inout [7:0] io, input oe);
reg [7:0] latch;
always @(io or oe)
    if (!oe)
        latch <= io;
assign io = oe ? ~latch : 8'bz;
endmodule

module abc9_test011(inout io, input oe);
reg latch;
always @(io or oe)
    if (!oe)
        latch <= io;
//assign io = oe ? ~latch : 8'bz;
endmodule

module abc9_test012(inout io, input oe);
reg latch;
//always @(io or oe)
//    if (!oe)
//        latch <= io;
assign io = oe ? ~latch : 8'bz;
endmodule

module abc9_test013(inout [3:0] io, input oe);
reg [3:0] latch;
always @(io or oe)
    if (!oe)
        latch[3:0] <= io[3:0];
    else
        latch[7:4] <= io;
assign io[3:0] = oe ? ~latch[3:0] : 4'bz;
assign io[7:4] = !oe ? {latch[4], latch[7:3]} : 4'bz;
endmodule

module abc9_test014(inout [7:0] io, input oe);
abc9_test012_sub sub(io, oe);
endmodule

module abc9_test012_sub(inout [7:0] io, input oe);
reg [7:0] latch;
always @(io or oe)
    if (!oe)
        latch[3:0] <= io;
    else
        latch[7:4] <= io;
assign io[3:0] = oe ? ~latch[3:0] : 4'bz;
assign io[7:4] = !oe ? {latch[4], latch[7:3]} : 4'bz;
endmodule

module abc9_test015(input a, output b, input c);
assign b = ~a;
(* keep *) wire d;
assign d = ~c;
endmodule

module abc9_test016(input a, output b);
assign b = ~a;
(* keep *) reg c;
always @* c <= ~a;
endmodule

module abc9_test017(input a, output b);
assign b = ~a;
(* keep *) reg c;
always @* c = b;
endmodule

module abc9_test018(input a, output b, output c);
assign b = ~a;
(* keep *) wire [1:0] d;
assign c = &d;
endmodule

module abc9_test019(input a, output b);
assign b = ~a;
(* keep *) reg [1:0] c;
reg d;
always @* d <= &c;
endmodule

module abc9_test020(input a, output b);
assign b = ~a;
(* keep *) reg [1:0] c;
(* keep *) reg d;
always @* d <= &c;
endmodule

module abc9_test021(clk, rst, s_eth_hdr_valid, s_eth_hdr_ready, s_eth_dest_mac, s_eth_src_mac, s_eth_type, s_eth_payload_axis_tdata, s_eth_payload_axis_tkeep, s_eth_payload_axis_tvalid, s_eth_payload_axis_tready, s_eth_payload_axis_tlast, s_eth_payload_axis_tid, s_eth_payload_axis_tdest, s_eth_payload_axis_tuser, m_eth_hdr_valid, m_eth_hdr_ready, m_eth_dest_mac, m_eth_src_mac, m_eth_type, m_eth_payload_axis_tdata, m_eth_payload_axis_tkeep, m_eth_payload_axis_tvalid, m_eth_payload_axis_tready, m_eth_payload_axis_tlast, m_eth_payload_axis_tid, m_eth_payload_axis_tdest, m_eth_payload_axis_tuser);
  input clk;
  output [47:0] m_eth_dest_mac;
  input m_eth_hdr_ready;
  output m_eth_hdr_valid;
  output [7:0] m_eth_payload_axis_tdata;
  output [7:0] m_eth_payload_axis_tdest;
  output [7:0] m_eth_payload_axis_tid;
  output m_eth_payload_axis_tkeep;
  output m_eth_payload_axis_tlast;
  input m_eth_payload_axis_tready;
  output m_eth_payload_axis_tuser;
  output m_eth_payload_axis_tvalid;
  output [47:0] m_eth_src_mac;
  output [15:0] m_eth_type;
  input rst;
  input [191:0] s_eth_dest_mac;
  output [3:0] s_eth_hdr_ready;
  input [3:0] s_eth_hdr_valid;
  input [31:0] s_eth_payload_axis_tdata;
  input [31:0] s_eth_payload_axis_tdest;
  input [31:0] s_eth_payload_axis_tid;
  input [3:0] s_eth_payload_axis_tkeep;
  input [3:0] s_eth_payload_axis_tlast;
  output [3:0] s_eth_payload_axis_tready;
  input [3:0] s_eth_payload_axis_tuser;
  input [3:0] s_eth_payload_axis_tvalid;
  input [191:0] s_eth_src_mac;
  input [63:0] s_eth_type;
  (* keep *)
  wire [0:0] grant, request;
  wire a;
  not u0 (
    a,
    grant[0]
  );
  and u1  (
    request[0],
    s_eth_hdr_valid[0],
    a
  );
  (* keep *)
  MUXF8 u2  (
    .I0(1'bx),
    .I1(1'bx),
    .O(o),
    .S(1'bx)
  );
  arbiter  arb_inst (
    .acknowledge(acknowledge),
    .clk(clk),
    .grant(grant),
    .grant_encoded(grant_encoded),
    .grant_valid(grant_valid),
    .request(request),
    .rst(rst)
  );
endmodule

module arbiter (clk, rst, request, acknowledge, grant, grant_valid, grant_encoded);
  input [3:0] acknowledge;
  input clk;
  output [3:0] grant;
  output [1:0] grant_encoded;
  output grant_valid;
  input [3:0] request;
  input rst;
endmodule

(* abc_box_id=1 *)
module MUXF8(input I0, I1, S, output O);
endmodule