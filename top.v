module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);
    wire z_onehot, z_binary;
    wire [4:0] onehot_state;
    wire [2:0] binary_state;

    onehot oh(.w(sw), .clk(btnC), .reset(btnU), .z(z_onehot), .state(onehot_state));
    binary bn(.w(sw), .clk(btnC), .reset(btnU), .z(z_binary), .state(binary_state));

    // led[0] one-hot z, led[1] binary z, led[6:2] one-hot A..E, led[9:7] binary state
    assign led = {binary_state, onehot_state, z_binary, z_onehot};
endmodule