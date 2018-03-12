module Incredible
  module Wizard
    extend ActiveSupport::Concern
    include Wicked::Wizard
    
    attr_accessor :wizard_form, :step_data, :template, :rules, :questions

    included do
      before_action :load_step, only: %i[show update]
      before_action :process_rules, only: :update
      before_action :load_step_data, only: %i[show update]
    end
    
    def load_step
      self.step_data = wizard_form.find_step(params[:id])
    end
    
    def load_step_data
      self.template = step_data.template
      self.questions = step_data.questions
    end
    
    def process_rules
      return unless step_data.rule
      @rule = step_data.rule.send(:new, params)
      jump_to @rule.next_step
    end
    
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
