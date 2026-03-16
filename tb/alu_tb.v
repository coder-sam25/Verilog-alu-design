module alu_tb;
    reg  [5:0] A, B;
    reg  [2:0] opcode;
    wire [5:0] X;
    wire [3:0] flag;
    
    // Instantiating the Unit Under Test (UUT)
    alu uut (.A(A), .B(B), .opcode(opcode), .X(X), .flag(flag));
    
    initial begin
      $dumpfile("ALU.vcd");
      $dumpvars(0);
        // Test Addition
        A = 6'd10; B = 6'd20; opcode = 3'b000; #100;
        // Test Subtraction
        A = 6'd20; B = 6'd20; opcode = 3'b001; #100; 
        A = 6'd20; B = 6'd10; opcode = 3'b001; #100;
        // Test AND
        A = 6'b101010; B = 6'b001100; opcode = 3'b010; #100; 
        // Test OR
        opcode = 3'b011; #100; 
        // Test XOR
        opcode = 3'b100; #100; 
        // Test NOT 
        opcode = 3'b101; #100; 
        // Test Logical Shift Left
        A = 6'b100001; opcode = 3'b110; #100;
        // Test Logical Shift Right
        A = 6'b100001; opcode = 3'b111; #100;      
        $finish;
    end
endmodule
