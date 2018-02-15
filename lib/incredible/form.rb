module Incredible
  class Form
    def initialize(name)
      @data = Incredible::Loader.load(name)
    end
    
    def step_names
      steps.keys
    end

    def steps
      @data['form']['steps']
    end
    
  end
end
