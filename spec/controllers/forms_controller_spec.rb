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
  
end
