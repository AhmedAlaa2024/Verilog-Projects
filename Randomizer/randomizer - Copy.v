module randomizer (
    input          Clock,
    input          Reset,
    input          Enable,
    input          Load,
    input          DataIn,
    input   [14:0] Seed,
    output reg        DataOut,
    output reg [14:0] buffer
);


// We designed it as the Enable has the foolowing order: periority > Reset > Load > Randomization.

always @(posedge Clock) begin
    if (Enable) begin // If Enable is high, We look at the Reset first.
        if (Reset) begin // If Reset is high, then we don't care about if Load is high or not.
            buffer = 15'b000000000000000;
        end
        else begin
            if (Load) begin // If Load is high, then We should keep loading until Load is triggred to zero again.
                buffer = Seed;
                DataOut = ((buffer[0] ^ buffer[1]) ^ DataIn);
            end
            else begin // If Enable is high, Reset is low and load is low, then randomize the data in the buffer, and calculate the output.
                buffer = {(buffer[0] ^ buffer[1]),buffer[14:1]};
                DataOut = ((buffer[0] ^ buffer[1]) ^ DataIn);
            end
        end
    end
end
    
endmodule