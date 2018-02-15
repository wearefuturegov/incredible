module Incredible
  class Loader
    class FormNotFound < StandardError; end
    class BadYAML < StandardError; end

    def self.load(name)
      filename = "#{name}.yml"
      new(filename).data
    end

    def initialize(filename)
      @path = Rails.root.join('config', 'forms', filename)
    end

    def data
      YAML.safe_load File.open(@path), [Symbol]
    rescue Errno::ENOENT => e
      raise FormNotFound, e.message
    rescue Psych::SyntaxError => e
      raise BadYAML, e.message
    end
  
  end
end
