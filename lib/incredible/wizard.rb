module Incredible
  module Wizard
    extend ActiveSupport::Concern
    include Wicked::Wizard
    
    attr_accessor :wizard_form, :step_data, :template, :rules, :questions

    included do
      before_action :load_step
      before_action :process_rules, only: :update
      before_action :load_step_data
    end
    
    def load_step
      self.step_data = wizard_form.find_step(params[:id])
    end
    
    def load_step_data
      self.template = step_data.template
      self.questions = step_data.questions
    end
    
    def process_rules
      self.rules = step_data.rules
      next_step = permitted_params.to_h.map do |k, v|
        rules.dig(k, v)
      end&.first
      jump_to next_step if next_step
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
