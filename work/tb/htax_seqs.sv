///////////////////////////////////////////////////////////////////////////
// Texas A&M University
// CSCE 616 Hardware Design Verification
// Created by  : Prof. Quinn and Saumil Gogri
///////////////////////////////////////////////////////////////////////////

//Base sequence 
class htax_base_seq extends uvm_sequence #(htax_packet_c); //HTAX packet class is passed as parameter

  parameter PORTS = `PORTS;
  parameter VC    = `VC;
  parameter WIDTH = `WIDTH;

	//Factory Registration
	`uvm_object_utils(htax_base_seq)

	//Constructor
	function new ( string name = "htax_base_seq");
		super.new(name);
	endfunction : new

endclass : htax_base_seq

//Sequence 1
//Fix Destination Port Sequence extends from base sequence
class fix_dest_port_seq extends htax_base_seq;

	//Factory Registration
	`uvm_object_utils(fix_dest_port_seq)

	//Constructor
	function new ( string name = "fix_dest_port_seq");
    super.new(name);
  endfunction : new

	//Body task -- 
	virtual task body();
		int i;
		i=$urandom_range(0,3);
		`uvm_info(get_type_name(),"Executing fix destination port sequence with 5 transactions", UVM_NONE)
		//Generate a sequence with 5 packets
		repeat(5) begin
			`uvm_do_with (req, {req.dest_port==i;}) //fix dest_port 
		end
	endtask

endclass : fix_dest_port_seq

//CSCE616 Sequence - Sends "CSCE616" message to port 2
class csce616_seq extends htax_base_seq;

  //Factory Registration
  `uvm_object_utils(csce616_seq)

  //Constructor
  function new ( string name = "csce616_seq");
    super.new(name);
  endfunction : new

  //Body task -- sends CSCE616 to port 2
  virtual task body();
    
    `uvm_info(get_type_name(),"Sending CSCE616 packet to port 2!", UVM_NONE)
    
    // Send packet with "CSCE616" in data
    // ASCII: C=43, S=53, C=43, E=45, 6=36, 1=31, 6=36
    `uvm_do_with(req, {
      req.dest_port == 2;
      req.length == 3;
      req.data[0] == 64'h4353434536313600;  // "CSCE616"
    })
    
  endtask

endclass : csce616_seq
