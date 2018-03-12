class FormsController < ActionController::Base
  include Incredible::Wizard
  
  form 'form'

  def show
    render_wizard nil, template: "forms/#{template}"
  end

  def update
    @model = StubModel.new(permitted_params)
    render_wizard @model, {}, (@rule&.next_params || {})
  end
  
  private
  
  def permitted_params
    params.require(:model).permit(:name, :postcode, :email, :phone_number)
  end
end
