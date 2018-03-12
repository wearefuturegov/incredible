class Step1Rule < Incredible::Rule
  
  def process
    return unless params[:model][:name] == 'Mike'
    @next_params = { foo: :bar }
    @next_step = :step3
  end
  
end
