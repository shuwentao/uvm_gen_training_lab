//
// Template for UVM-compliant Program block

`ifndef TOP_ENV_TB_MOD__SV
`define TOP_ENV_TB_MOD__SV

`include "mstr_slv_intfs.incl"
module top_env_tb_mod;

import uvm_pkg::*;

`include "top_env_env.sv"
`include "top_env_test.sv"  //ToDo: Change this name to the testcase file-name

//bit sys_clk;
//bit sys_rst;

// ToDo: Include all other test list here
   //my_mst_interface v_if1(sys_clk);
   //my_slave_interface v_if2(sys_clk);

   typedef virtual my_mst_interface v_if1;
   typedef virtual my_slave_interface v_if2;
   initial begin
      uvm_config_db #(v_if1)::set(null,"","mst_if",top_env_top.mst_if); 
      uvm_config_db #(v_if2)::set(null,"","slv_if",top_env_top.slv_if);
      run_test();
   end

//initial
//    begin
//        sys_clk = 1'b0 ;
//        forever #10 sys_clk = ~ sys_clk;
//    end
//
//initial
//    begin
//        sys_rst = 1'b0 ;
//        repeat(50) begin
//            @(posedge sys_clk);
//        end
//        sys_rst = 1'b1 ;
//        repeat(10) begin
//            @(posedge sys_clk);
//        end
//        sys_rst = 1'b0 ;
//    end



 




endmodule: top_env_tb_mod

`endif // TOP_ENV_TB_MOD__SV

