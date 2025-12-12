//
// Template for UVM-compliant Monitor to Coverage Connector Callbacks
//

`ifndef MY_MST_MONITOR_2COV_CONNECT
`define MY_MST_MONITOR_2COV_CONNECT
class my_mst_monitor_2cov_connect extends uvm_component;
   top_env_cov cov;
   uvm_analysis_export # (my_mst_transaction) an_exp;
   `uvm_component_utils(my_mst_monitor_2cov_connect)
   function new(string name="", uvm_component parent=null);
   	super.new(name, parent);
   endfunction: new

   virtual function void write(my_mst_transaction tr);
      cov.tr = tr;
      -> cov.cov_event;
   endfunction:write 
endclass: my_mst_monitor_2cov_connect

`endif // MY_MST_MONITOR_2COV_CONNECT
