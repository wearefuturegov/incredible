class Step3Rule < Incredible::Rule
  include Rails.application.routes.url_helpers
  
  def process
    @redirect = things_path
  end
  
end
