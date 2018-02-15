module Incredible
  class Form
    def initialize(name)
      @data = Incredible::Loader.load(name)
    end
    
    def step_names
      raw_steps.keys
    end
    
    def steps
      @steps ||= raw_steps.map { |k, v| { k => Step.new(v) } }.reduce(:merge)
    end
    
    def find_step(step_name)
      steps[step_name]
    end
    
    private

    def raw_steps
      @data['form']['steps']
    end
    
  end
end
