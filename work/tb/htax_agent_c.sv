///////////////////////////////////////////////////////////////////////////
// Texas A&M University
// CSCE 616 Hardware Design Verification
// File name   : htax_agent_c.sv
///////////////////////////////////////////////////////////////////////////

class htax_agent_c extends uvm_agent;
  
  parameter PORTS = `PORTS;
  parameter VC    = `VC;
  parameter WIDTH = `WIDTH;
  
  // Factory registration
  `uvm_component_utils(htax_agent_c)
  
  // Configuration handle
  htax_agent_config cfg;
  
  // Agent components
  htax_sequencer_c sequencer;
  htax_tx_driver_c driver;
  
  // Constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
  
  // UVM build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // TODO 1: Get configuration from config_db (ALREADY COMPLETED AS EXAMPLE)
    if(!uvm_config_db#(htax_agent_config)::get(this, "", "cfg", cfg))
      `uvm_fatal(get_type_name(), "Failed to get agent configuration")
    
    // Only create sequencer and driver if agent is ACTIVE
    if(cfg.is_active == UVM_ACTIVE) begin
      // TODO 2: Create sequencer using factory
      
      // TODO 3: Create driver using factory
      
    end
    
    `uvm_info(get_type_name(), $sformatf("Agent in %s mode", 
              cfg.is_active == UVM_ACTIVE ? "ACTIVE" : "PASSIVE"), UVM_LOW)
  endfunction : build_phase
  
  // UVM connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    // Only connect if agent is ACTIVE
    if(cfg.is_active == UVM_ACTIVE) begin
      // TODO 4: Connect driver's seq_item_port to sequencer's seq_item_export
      
    end
  endfunction : connect_phase
  
endclass : htax_agent_c
