//
// Template for UVM-compliant interface
//

`ifndef MY_SLAVE_INTERFACE__SV
`define MY_SLAVE_INTERFACE__SV

interface my_slave_interface (input bit clk);

   // ToDo: Define default setup & hold times
   logic [7:0] data ;
   logic       vld  ;

   parameter setup_time = 1/*ns*/;
   parameter hold_time  = 0/*ns*/;

   // ToDo: Define synchronous and asynchronous signals as wires

   //logic       async_en;
   //logic       async_rdy;

   // ToDo: Define one clocking block per clock domain
   //       with synchronous signal direction from a
   //       master perspective

   //clocking mck @(posedge clk);
   //   default input #setup_time output #hold_time;

   //   // ToDo: List the synchronous signals here

   //endclocking: mck

   clocking sck @(posedge clk);
      default input #setup_time output #hold_time;

      // ToDo: List the synchronous signals here
      input data ;
      input vld  ;

   endclocking: sck

   clocking pck @(posedge clk);
      default input #setup_time output #hold_time;

      //ToDo: List the synchronous signals here
      input data ;
      input vld  ;

   endclocking: pck

   modport slave  (clocking sck);
   modport passive (clocking pck);
   //modport master(clocking mck,
   //               output async_en,
   //               input  async_rdy);

   //modport slave(clocking sck,
   //              input  async_en,
   //              output async_rdy);

   //modport passive(clocking pck,
   //                input async_en,
   //                input async_rdy);

endinterface: my_slave_interface

`endif // MY_SLAVE_INTERFACE__SV
