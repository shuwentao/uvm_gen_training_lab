//
// Template for UVM Scoreboard

`ifndef MY_SCB__SV
`define MY_SCB__SV


class my_scb extends uvm_scoreboard;

   uvm_analysis_export #(my_mst_transaction) before_export, after_export;
   uvm_in_order_class_comparator #(my_mst_transaction) comparator;

   `uvm_component_utils(my_scb)
	extern function new(string name = "my_scb",
                    uvm_component parent = null); 
	extern virtual function void build_phase (uvm_phase phase);
	extern virtual function void connect_phase (uvm_phase phase);
	extern virtual task main_phase(uvm_phase phase);
	extern virtual function void report_phase(uvm_phase phase);

endclass: my_scb


function my_scb::new(string name = "my_scb",
                 uvm_component parent);
   super.new(name,parent);
endfunction: new

function void my_scb::build_phase(uvm_phase phase);
    super.build_phase(phase);
    before_export = new("before_export", this);
    after_export  = new("after_export", this);
    comparator    = new("comparator", this);
endfunction:build_phase

function void my_scb::connect_phase(uvm_phase phase);
    before_export.connect(comparator.before_export);
    after_export.connect(comparator.after_export);
endfunction:connect_phase

task my_scb::main_phase(uvm_phase phase);
    super.main_phase(phase);
    phase.raise_objection(this,"scbd..");
	comparator.run();
    phase.drop_objection(this);
endtask: main_phase 

function void my_scb::report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("SBRPT", $psprintf("Matches = %0d, Mismatches = %0d",
               comparator.m_matches, comparator.m_mismatches),
               UVM_MEDIUM);
endfunction:report_phase

`endif // MY_SCB__SV
