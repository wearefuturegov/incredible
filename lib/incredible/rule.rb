module Incredible
  class Rule
    attr_accessor :next_params
    attr_accessor :redirect
    attr_accessor :next_step
    attr_reader :params
  
    def initialize(params)
      @params = params
      process
    end
    
    def process; end
    
  end
end
