module Incredible
  module Wizard
    extend ActiveSupport::Concern
    include Wicked::Wizard
    
    attr_accessor :wizard_form, :step, :template, :rules, :questions

    included do
      before_action :load_step_data
      before_action :process_rules, only: :update
    end
    
    def load_step_data
      step = wizard_form.find_step(params[:id])
      self.template = step.template
      self.rules = step.rules
      self.questions = step.questions
    end
    
    def process_rules; end
    
    module ClassMethods
      def form(form_name)
        wizard_form = Incredible::Form.new(form_name)
        steps(*wizard_form.step_names)
        prepend_before_action do
          self.wizard_form = wizard_form
        end
      end
    end
    
  end
end
