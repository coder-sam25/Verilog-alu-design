module alu(
    input [5:0] A,
    input [5:0] B,
    input [2:0] opcode,
    output reg [5:0] X,
    output reg [3:0] flag
    );
    
    reg [6:0] tmp7;  // 7-bit temporary register to hold extended results
    
    always @(*) begin 
        X     = 6'b000000;
        flag  = 4'b0000;
        
        // Operation selection
        case (opcode)
            3'b000: begin // ADD
                tmp7 = {1'b0, A} + {1'b0, B}; 
                X = tmp7[5:0];                 
                flag[1] = tmp7[6]; // Carry flag is the 7th bit
                // Overflow logic for signed addition
                flag[3] = (~A[5] & ~B[5] & X[5]) | (A[5] & B[5] & ~X[5]); 
            end
            
            3'b001: begin // SUB:A - B = A + ~B + 1
                tmp7 = {1'b0, A} + {1'b0, (~B)} + 7'd1;
                X = tmp7[5:0];
                flag[1] = tmp7[6]; // Carry/Borrow flag
                // Overflow logic for signed subtraction
                flag[3] = (A[5] & ~B[5] & ~X[5]) | (~A[5] & B[5] & X[5]);
            end
            
            3'b010: X = A & B;   // AND
            3'b011: X = A | B;   // OR
            3'b100: X = A ^ B;   // XOR
            3'b101: X = ~A;      // NOT
            
            3'b110: begin        // LSL
                flag[1] = A[5];  // Carry out is the MSB before shift
                X = A << 1;      // Shift left by one
            end
            
            3'b111: begin        // LSR
                flag[1] = A[0];  // Carry out is the LSB before shift
                X = A >> 1;      // Shift right by one
            end
        endcase
        
        // Set Sign and Zero flags based on the final result X
        flag[0] = X[5]; // Sign flag is the MSB of result
        flag[2] = (X == 6'b000000); // Zero flag is set if result is zero
    end 
endmodule
