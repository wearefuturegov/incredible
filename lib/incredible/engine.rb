module Incredible
  class Engine < ::Rails::Engine
    isolate_namespace Incredible
    
    config.generators do |g|
      g.test_framework :rspec, fixture: false
    end
  end
end
