// Implement binary state machine
module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] state
);
    wire [2:0] S;
    wire [2:0] N;

    // Y2 = w & (y2 | y1&y0)
    assign N[2] = w & (S[2] | (S[1] & S[0]));
    // Y1 = w&~y2&~y1 | w&~y2&~y0 | ~w&~y1&y0 | ~w&y1&~y0
    assign N[1] = (w & ~S[2] & ~S[1]) | (w & ~S[2] & ~S[0])
                | (~w & ~S[1] & S[0]) | (~w & S[1] & ~S[0]);
    // Y0 = w&~y2&~y1 | w&~y2&~y0 | ~w&~y1&~y0 | ~w&y1&y0
    assign N[0] = (w & ~S[2] & ~S[1]) | (w & ~S[2] & ~S[0])
                | (~w & ~S[1] & ~S[0]) | (~w & S[1] & S[0]);

    dff b0(.Default(1'b0), .D(N[0]), .clk(clk), .reset(reset), .Q(S[0]));
    dff b1(.Default(1'b0), .D(N[1]), .clk(clk), .reset(reset), .Q(S[1]));
    dff b2(.Default(1'b0), .D(N[2]), .clk(clk), .reset(reset), .Q(S[2]));

    // z is high in C (010) and E (100): z = ~y0 & (y1 | y2)
    assign z = ~S[0] & (S[1] | S[2]);
    assign state = S;
endmodule