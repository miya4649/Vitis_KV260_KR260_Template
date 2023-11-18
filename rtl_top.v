// rev. 1

module rtl_top
  (
   input  clk,
   input  resetn,
   output led
   );

  reg reset;
  reg resetn1;
  reg resetn2;
  reg [26:0] counter;

  always @(posedge clk)
    begin
      resetn1 <= resetn;
      resetn2 <= resetn1;
      reset <= ~resetn2;
    end

  always @(posedge clk)
    begin
      if (reset == 1'b1)
        begin
          counter <= 0;
        end
      else
        begin
          counter <= counter + 1;
        end
    end

  assign led = counter[26];

endmodule
