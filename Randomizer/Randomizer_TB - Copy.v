module randomizer_tb ();
    reg          clk = 0;
    reg          Reset;
    reg          Enable;
    reg          Load;
    reg          DataIn;
    reg  [14:0]  Seed;
    wire         DataOut;
    wire [14:0]  buffer;

    randomizer UUT (clk, Reset, Enable, Load, DataIn, Seed, DataOut, buffer);

    localparam PERIOD = 10;

    integer i = 0;
    integer j = 0;
    integer No = 0;
    integer success = 0;
    // DataIn: AC BC D2 11 4D AE 15 77 C6 DB F4 C9
    wire [0:3] TestCases [0:23];
    assign TestCases[0] = 4'hA;
    assign TestCases[1] = 4'hC;
    assign TestCases[2] = 4'hB;
    assign TestCases[3] = 4'hC;
    assign TestCases[4] = 4'hD;
    assign TestCases[5] = 4'h2;
    assign TestCases[6] = 4'h1;
    assign TestCases[7] = 4'h1;
    assign TestCases[8] = 4'h4;
    assign TestCases[9] = 4'hD;
    assign TestCases[10] = 4'hA;
    assign TestCases[11] = 4'hE;
    assign TestCases[12] = 4'h1;
    assign TestCases[13] = 4'h5;
    assign TestCases[14] = 4'h7;
    assign TestCases[15] = 4'h7;
    assign TestCases[16] = 4'hC;
    assign TestCases[17] = 4'h6;
    assign TestCases[18] = 4'hD;
    assign TestCases[19] = 4'hB;
    assign TestCases[20] = 4'hF;
    assign TestCases[21] = 4'h4;
    assign TestCases[22] = 4'hC;
    assign TestCases[23] = 4'h9;

    // DataOut: 55 8A C4 A5 3A 17 24 E1 63 AC 2B F9
    wire [0:3] ExpectedOutput [0:23];
    assign ExpectedOutput[0] = 4'h5;
    assign ExpectedOutput[1] = 4'h5;
    assign ExpectedOutput[2] = 4'h8;
    assign ExpectedOutput[3] = 4'hA;
    assign ExpectedOutput[4] = 4'hC;
    assign ExpectedOutput[5] = 4'h4;
    assign ExpectedOutput[6] = 4'hA;
    assign ExpectedOutput[7] = 4'h5;
    assign ExpectedOutput[8] = 4'h3;
    assign ExpectedOutput[9] = 4'hA;
    assign ExpectedOutput[10] = 4'h1;
    assign ExpectedOutput[11] = 4'h7;
    assign ExpectedOutput[12] = 4'h2;
    assign ExpectedOutput[13] = 4'h4;
    assign ExpectedOutput[14] = 4'hE;
    assign ExpectedOutput[15] = 4'h1;
    assign ExpectedOutput[16] = 4'h6;
    assign ExpectedOutput[17] = 4'h3;
    assign ExpectedOutput[18] = 4'hA;
    assign ExpectedOutput[19] = 4'hC;
    assign ExpectedOutput[20] = 4'h2;
    assign ExpectedOutput[21] = 4'hB;
    assign ExpectedOutput[22] = 4'hF;
    assign ExpectedOutput[23] = 4'h9;
initial begin
    // Setup Configurations 0
    Enable <= 1'b1;
    Reset <= 1'b1;
    #PERIOD
    
    // Setup Configurations 1
    Enable <= 1'b1;
    Reset <= 1'b0;
    Load <= 1;
    Seed <= 15'b011011100010101;
    DataIn <= TestCases[0][0];
    $display("\t\tNo.\tShift Register\t\t\tXOR#1\t\tData In\t\tDataOut");
    #PERIOD
    if (DataOut == ExpectedOutput[0][0]) begin
	success = success + 1;
        No = No + 1;
    end
    $display("%d\t\t\t%b\t\t\t%b\t\t%b\t%b", No , buffer, buffer[0]^buffer[1], DataIn, DataOut);    	
    // Setup Configurations 2
    Enable <= 1'b1;
    Reset <= 1'b0;
    Load <= 1'b0;
    
for (i = 0; i < 24; i = i + 1) begin
        for (j = 0; j < 4; j = j + 1) begin
            if ((i != 0) || (j != 0)) begin
                DataIn <= TestCases[i][j];
                #PERIOD
		No = No+1;
                $display("%d\t\t\t%b\t\t\t%b\t\t%b\t%b", No , buffer, buffer[0]^buffer[1], DataIn, DataOut);
                if (DataOut == ExpectedOutput[i][j])
                            success = success + 1;   
             end
         end
end

    $display("%d of 96 test case is successful", success);
    if (success == 96)
        $display("Randomizer is Validated!");
end
    always #(PERIOD/2) clk = ~clk;
endmodule