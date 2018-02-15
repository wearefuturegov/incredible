module Incredible
  class Step
    
    def initialize(data)
      @data = data.symbolize_keys
      
      %I[questions rules template].each do |k|
        self.class.send :define_method, k.to_sym do
          @data[k]
        end
      end
    end
    
  end
end
