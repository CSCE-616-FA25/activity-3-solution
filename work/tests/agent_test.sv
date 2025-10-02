///////////////////////////////////////////////////////////////////////////
// Texas A&M University
// CSCE 616 Hardware Design Verification
// File name   : agent_test.sv
///////////////////////////////////////////////////////////////////////////

class agent_test extends base_test;
  
  // Factory registration
  `uvm_component_utils(agent_test)
  
  // Agent and its configuration
  htax_agent_c agent;
  htax_agent_config agent_cfg;
  
  // Sequence handles
  fix_dest_port_seq fix_seq;
  random_seq rand_seq;
  
  // Constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
  
  // UVM build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // TODO 5: Create agent configuration
    
    // TODO 6: Configure the agent
    
    // Set configuration in config_db so agent can retrieve it
    uvm_config_db#(htax_agent_config)::set(this, "agent", "cfg", agent_cfg);
    
    // TODO 7: Create agent using factory
        
    // TODO 8: Create fix_dest_port_seq using factory 
    
    // TODO 9: Create random_seq using factory
    
    
  endfunction : build_phase
  
  // UVM run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    `uvm_info(get_type_name(), "Starting Agent Test", UVM_NONE)
    
    // Raise objection to keep simulation running
    phase.raise_objection(this);
    
    // TODO 10: Start both sequences on agent.sequencer (NOT just sequencer!)

    
    // Drop objection to allow simulation to end
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 5us);
  endtask : run_phase
  
endclass : agent_test
