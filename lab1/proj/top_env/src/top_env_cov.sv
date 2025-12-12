//
// Template for UVM-compliant Coverage Class
//

`ifndef TOP_ENV_COV__SV
`define TOP_ENV_COV__SV

class top_env_cov extends uvm_component;
   event cov_event;
   my_mst_transaction tr;
   uvm_analysis_imp #(my_mst_transaction, top_env_cov) cov_export;
   `uvm_component_utils(top_env_cov)
 
   covergroup cg_trans @(cov_event);
      coverpoint tr.kind;
      // ToDo: Add required coverpoints, coverbins
   endgroup: cg_trans


   function new(string name, uvm_component parent);
      super.new(name,parent);
      cg_trans = new;
      cov_export = new("Coverage Analysis",this);
   endfunction: new

   virtual function write(my_mst_transaction tr);
      this.tr = tr;
      -> cov_event;
   endfunction: write

endclass: top_env_cov

`endif // TOP_ENV_COV__SV

