module ID_EX (clk, rst, ID_EX_WR, PC_PLUS4_IN,PC_PLUS4_OUT, INSTR_IN,INSTR_OUT);
               
   input         clk;
   input         rst;
   input         ID_EX_WR; 
   input  [31:0] PC_PLUS4_IN;
   input  [31:0] INSTR_IN;
   output reg [31:0] PC_PLUS4_OUT;
   output reg [31:0] INSTR_OUT;
   

               
   always @(posedge clk or posedge rst)
    begin
      if ( rst )
        begin
            PC_PLUS4_OUT<=0;
            INSTR_OUT<= 0;
        end
      else if (ID_EX_WR)
        begin
            PC_PLUS4_OUT <= PC_PLUS4_IN;
            INSTR_OUT<=INSTR_IN;
        end
   end // end always
      
endmodule