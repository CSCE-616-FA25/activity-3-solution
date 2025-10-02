///////////////////////////////////////////////////////////////////////////
// Texas A&M University
// CSCE 616 Hardware Design Verification
// File name   : htax_agent_config.sv
///////////////////////////////////////////////////////////////////////////

class htax_agent_config extends uvm_object;
  
  // Configuration: ACTIVE or PASSIVE mode
  uvm_active_passive_enum is_active = UVM_ACTIVE;
  
  // Port ID for this agent instance
  int port_id = 0;
  
  // Factory registration
  `uvm_object_utils_begin(htax_agent_config)
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON)
    `uvm_field_int(port_id, UVM_ALL_ON)
  `uvm_object_utils_end
  
  // Constructor
  function new(string name = "htax_agent_config");
    super.new(name);
  endfunction : new
  
endclass : htax_agent_config
