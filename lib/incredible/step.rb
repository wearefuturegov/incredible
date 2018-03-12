module Incredible
  class Step
        
    def initialize(name, data)
      @name = name.to_s
      @data = data.symbolize_keys
      
      %I[questions template next_step].each do |k|
        self.class.send :define_method, k.to_sym do
          @data[k]
        end
      end
    end
    
    def rule
      rule_class = "#{@name.camelize}Rule"
      rule_class.constantize
    rescue NameError
      nil
    end
    
  end
end
