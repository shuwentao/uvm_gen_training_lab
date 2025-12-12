//
// Template for UVM-compliant transaction descriptor


`ifndef MY_MST_TRANSACTION__SV
`define MY_MST_TRANSACTION__SV


class my_mst_transaction extends uvm_sequence_item;

   typedef enum {READ, WRITE } kinds_e;
   rand kinds_e kind;
   typedef enum {IS_OK, ERROR} status_e;
   rand status_e status;
   rand byte sa;
   rand bit [10:0] data;

   // ToDo: Add constraint blocks to prevent error injection
   // ToDo: Add relevant class properties to define all transactions
   // ToDo: Modify/add symbolic transaction identifiers to match

   constraint my_mst_transaction_valid {
      // ToDo: Define constraint to make descriptor valid
      status == IS_OK;
   }
   `uvm_object_utils_begin(my_mst_transaction) 

      // ToDo: add properties using macros here
      `uvm_field_int(data,UVM_ALL_ON)
   
      `uvm_field_enum(kinds_e,kind,UVM_ALL_ON)
      `uvm_field_enum(status_e,status, UVM_ALL_ON)
   `uvm_object_utils_end
 
   extern function new(string name = "Trans");
endclass: my_mst_transaction


function my_mst_transaction::new(string name = "Trans");
   super.new(name);
endfunction: new


`endif // MY_MST_TRANSACTION__SV
