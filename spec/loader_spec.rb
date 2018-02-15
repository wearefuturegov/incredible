require 'spec_helper'

describe Incredible::Loader do

  describe 'self.load' do
    
    let(:form_name) { 'form' }
    let(:form) { Incredible::Loader.load(form_name) }
    
    it 'loads a form' do
      expect(form).to be_a(Hash)
      expect(form['form']['name']).to eq('Test form')
      expect(form['form']['steps'].keys).to eq(%w[step1 step2])
    end
    
    context 'with non-existent form' do
      
      let(:form_name) { 'something' }
      
      it 'raises an error' do
        expect { form }.to raise_error(Incredible::Loader::FormNotFound)
      end
      
    end
    
    context 'with badly formatted YAML' do
      
      let(:form_name) { 'bad-yaml' }

      it 'raises an error' do
        expect { form }.to raise_error(Incredible::Loader::BadYAML)
      end
      
    end
    
  end
  
end
