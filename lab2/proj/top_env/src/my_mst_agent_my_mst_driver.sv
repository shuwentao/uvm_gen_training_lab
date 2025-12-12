//
// Template for UVM-compliant physical-level transactor
//

`ifndef MY_MST_DRIVER__SV
`define MY_MST_DRIVER__SV

typedef class my_mst_transaction;
typedef class my_mst_driver;

class my_mst_driver_callbacks extends uvm_callback;

   // ToDo: Add additional relevant callbacks
   // ToDo: Use "task" if callbacks cannot be blocking

   // Called before a transaction is executed
   virtual task pre_tx( my_mst_driver xactor,
                        my_mst_transaction tr);
                                   
     // ToDo: Add relevant code

   endtask: pre_tx


   // Called after a transaction has been executed
   virtual task post_tx( my_mst_driver xactor,
                         my_mst_transaction tr);
     // ToDo: Add relevant code

   endtask: post_tx

endclass: my_mst_driver_callbacks


class my_mst_driver extends uvm_driver # (my_mst_transaction);

   
   typedef virtual my_mst_interface v_if; 
   v_if drv_if;
   `uvm_register_cb(my_mst_driver,my_mst_driver_callbacks); 
   
   extern function new(string name = "my_mst_driver",
                       uvm_component parent = null); 
 
      `uvm_component_utils_begin(my_mst_driver)
      // ToDo: Add uvm driver member
      `uvm_component_utils_end
   // ToDo: Add required short hand override method


   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task send(my_mst_transaction tr); 
   extern protected virtual task tx_driver();

endclass: my_mst_driver


function my_mst_driver::new(string name = "my_mst_driver",
                   uvm_component parent = null);
   super.new(name, parent);

   
endfunction: new


function void my_mst_driver::build_phase(uvm_phase phase);
   super.build_phase(phase);
   //ToDo : Implement this phase here

endfunction: build_phase

function void my_mst_driver::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   uvm_config_db#(v_if)::get(this, "", "mst_if", drv_if);
endfunction: connect_phase

function void my_mst_driver::end_of_elaboration_phase(uvm_phase phase);
   super.end_of_elaboration_phase(phase);
   if (drv_if == null)
       `uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");   
endfunction: end_of_elaboration_phase

function void my_mst_driver::start_of_simulation_phase(uvm_phase phase);
   super.start_of_simulation_phase(phase);
   //ToDo: Implement this phase here
endfunction: start_of_simulation_phase

 
task my_mst_driver::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   // ToDo: Reset output signals
endtask: reset_phase

task my_mst_driver::configure_phase(uvm_phase phase);
   super.configure_phase(phase);
   //ToDo: Configure your component here
endtask:configure_phase


task my_mst_driver::run_phase(uvm_phase phase);
   super.run_phase(phase);
   // phase.raise_objection(this,""); //Raise/drop objections in sequence file
   //fork 
      tx_driver();
   //join
   // phase.drop_objection(this);
endtask: run_phase


task my_mst_driver::tx_driver();
 forever begin
      my_mst_transaction tr;
      // ToDo: Set output signals to their idle state
      //this.drv_if.master.async_en      <= 0;
      `uvm_info("top_env_DRIVER", "Starting transaction...",UVM_LOW)
      seq_item_port.get_next_item(tr);
      //case (tr.kind) 
      //   my_mst_transaction::READ: begin
      //      // ToDo: Implement READ transaction

      //   end
      //   my_mst_transaction::WRITE: begin
      //      // ToDo: Implement READ transaction

      //   end
      //endcase
	  //`uvm_do_callbacks(my_mst_driver,my_mst_driver_callbacks,
      //              pre_tx(this, tr))
      send(tr); 
      seq_item_port.item_done();
      `uvm_info("top_env_DRIVER", "Completed transaction...",UVM_LOW)
      `uvm_info("top_env_DRIVER", tr.sprint(),UVM_MEDIUM)
      //`uvm_do_callbacks(my_mst_driver,my_mst_driver_callbacks,
      //              post_tx(this, tr))

   end
endtask : tx_driver

task my_mst_driver::send(my_mst_transaction tr);
   // ToDo: Drive signal on interface
   @(this.drv_if.mck);
   this.drv_if.mck.data <= tr.data ;
   this.drv_if.mck.vld  <= 1'b1 ;
   @(this.drv_if.mck);
   this.drv_if.mck.data <= 0 ;
   this.drv_if.mck.vld  <= 1'b0 ;
endtask: send


`endif // MY_MST_DRIVER__SV


