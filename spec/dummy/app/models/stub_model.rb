class StubModel
  include ActiveModel::Model
  
  attr_accessor :name, :postcode, :email, :phone_number
  
  def save
    true
  end
end
