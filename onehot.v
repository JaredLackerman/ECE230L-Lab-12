// Implement one-hot state machine
module onehot(
    input w,
    input clk,
    input reset,
    output z,
    output [4:0] state   // {E, D, C, B, A}
);
    wire Anext, Bnext, Cnext, Dnext, Enext;
    wire Astate, Bstate, Cstate, Dstate, Estate;

    // Nothing ever transitions into A (only reset gets you there)
    assign Anext = 1'b0;
    // B: reached on w=0 from A, D, E
    assign Bnext = ~w & (Astate | Dstate | Estate);
    // C: reached on w=0 from B or C
    assign Cnext = ~w & (Bstate | Cstate);
    // D: reached on w=1 from A, B, C
    assign Dnext = w & (Astate | Bstate | Cstate);
    // E: reached on w=1 from D or E
    assign Enext = w & (Dstate | Estate);

    dff Adff(.Default(1'b1), .D(Anext), .clk(clk), .reset(reset), .Q(Astate));
    dff Bdff(.Default(1'b0), .D(Bnext), .clk(clk), .reset(reset), .Q(Bstate));
    dff Cdff(.Default(1'b0), .D(Cnext), .clk(clk), .reset(reset), .Q(Cstate));
    dff Ddff(.Default(1'b0), .D(Dnext), .clk(clk), .reset(reset), .Q(Dstate));
    dff Edff(.Default(1'b0), .D(Enext), .clk(clk), .reset(reset), .Q(Estate));

    // Output is high in states C and E
    assign z = Cstate | Estate;
    assign state = {Estate, Dstate, Cstate, Bstate, Astate};
endmodule