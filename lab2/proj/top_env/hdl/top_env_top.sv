//
// Template for Top module
//

`ifndef TOP_ENV_TOP__SV
`define TOP_ENV_TOP__SV

`include "dut.incl"

module top_env_top();

   logic clk;
   logic rst;

   // Clock Generation
   parameter sim_cycle = 10;
   
   // Reset Delay Parameter
   parameter rst_delay = 50;

   always 
      begin
         #(sim_cycle/2) clk = ~clk;
      end

   my_mst_interface mst_if(clk);
   my_slave_interface slv_if(clk);
   
   top_env_tb_mod test(); 
   
   // ToDo: Include Dut instance here
    PCM_Encode u_PCM_Encode(
        .clk        (   clk         ),
        .aclr       (   rst         ),
        .Sig_In     (   mst_if.data ),
        .iNd        (   mst_if.vld  ),
        .Enc_Out    (   slv_if.data ),
        .Rdy        (   slv_if.vld  ) 
    );
  
   //Driver reset depending on rst_delay
   initial
      begin
         clk = 0;
         rst = 0;
      #1 rst = 1;
         repeat (rst_delay) @(clk);
         rst = 1'b0;
         @(clk);
   end



initial
    begin
        $vcdpluson();
    end

endmodule: top_env_top

`endif // TOP_ENV_TOP__SV
