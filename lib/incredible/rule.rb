module Incredible
  class Rule
    attr_accessor :next_params
    attr_accessor :redirect
    attr_accessor :next_step
    attr_reader :params
    attr_reader :request
  
    def initialize(params, request)
      @params = params
      @request = request
      process
    end
    
    def process; end
    
  end
end
