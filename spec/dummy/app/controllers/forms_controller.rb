class FormsController < ActionController::Base
  include Incredible::Wizard
  
  form 'form'

  def show
    render_wizard nil, template: "forms/#{template}"
  end

  def update
    render_wizard initial_application
  end
end
