class Step1Rule
  
  def self.process(params)
    return unless params[:model][:name] == 'Mike'
    :step3
  end
  
end
