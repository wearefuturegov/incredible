module Incredible
  module Wizard
    extend ActiveSupport::Concern
    include Wicked::Wizard
    
    attr_accessor :wizard_form, :incredible_step, :template, :rules, :questions

    included do
      before_action :load_step, only: %i[show update]
      before_action :load_next_step, only: :update
      before_action :load_questions_and_template, only: %i[show update]
    end
    
    def load_step
      @incredible_step = wizard_form.find_step(params[:id])
    end
    
    def load_questions_and_template
      self.template = incredible_step.template
      self.questions = incredible_step.questions
    end
    
    def load_next_step
      if incredible_step.rule
        @rule = incredible_step.rule.send(:new, params)
        process_rule
      elsif incredible_step.next_step
        jump_to incredible_step.next_step
      end
    end
    
    def process_rule
      if @rule.next_step
        jump_to @rule.next_step
      elsif @rule.redirect
        redirect_to @rule.redirect
      end
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
