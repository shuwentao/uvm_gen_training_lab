//
// Template for UVM-compliant sequencer class
//


`ifndef MY_MST_SEQUENCER__SV
`define MY_MST_SEQUENCER__SV


typedef class my_mst_transaction;
class my_mst_sequencer extends uvm_sequencer # (my_mst_transaction);

   `uvm_component_utils(my_mst_sequencer)
   function new (string name,
                 uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:my_mst_sequencer

`endif // MY_MST_SEQUENCER__SV
