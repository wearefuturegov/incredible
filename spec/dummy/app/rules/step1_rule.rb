class Step1Rule
  
  def self.process(params)
    return unless params[:name] == 'Mike'
    :step3
  end
  
end
