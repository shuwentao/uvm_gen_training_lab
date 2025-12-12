//
// Template for UVM-compliant sequencer class
//


`ifndef MY_SLAVE_SEQUENCER__SV
`define MY_SLAVE_SEQUENCER__SV


typedef class my_mst_transaction;
class my_slave_sequencer extends uvm_sequencer # (my_mst_transaction);

   `uvm_component_utils(my_slave_sequencer)
   function new (string name,
                 uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:my_slave_sequencer

`endif // MY_SLAVE_SEQUENCER__SV
