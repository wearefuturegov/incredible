require 'spec_helper'

describe Incredible::Form do
  
  let(:subject) { Incredible::Form.new('form') }
  
  describe '#step_names' do
    
    it 'returns step names' do
      expect(subject.step_names).to match_array(%w[step1 step2 step3 step4])
    end
    
  end
  
  describe '#steps' do
    
    it 'returns the correct amount of steps' do
      expect(subject.steps.count).to eq(4)
    end
    
    it 'returns steps as Steps' do
      expect(subject.steps['step1']).to be_a(Incredible::Step)
      expect(subject.steps['step2']).to be_a(Incredible::Step)
    end
    
  end
  
  describe '#find_step' do
    
    it 'finds a step by name' do
      expect(subject.find_step('step1')).to eq(subject.steps['step1'])
    end
    
  end
   
end
