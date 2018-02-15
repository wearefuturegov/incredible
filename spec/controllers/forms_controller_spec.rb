require 'spec_helper'

describe FormsController, type: :controller do
  
  context 'rendering templates' do
    it 'renders step 1 template' do
      expect(
        (get :show, params: { id: :step1 })
      ).to render_template('forms/foo')
    end
    
    it 'renders step 2 template' do
      expect(
        (get :show, params: { id: :step2 })
      ).to render_template('forms/bar')
    end
  end
  
  context 'rules' do
    it 'follows a rule' do
      expect(
        (put :update, params: { id: :step1, model: { name: 'Mike' } })
      ).to redirect_to('http://test.host/forms/step3')
    end
    
    it 'goes to the next step by default' do
      expect(
        (put :update, params: { id: :step1, model: { name: 'Ian' } })
      ).to redirect_to('http://test.host/forms/step2')
    end
  end
  
end
