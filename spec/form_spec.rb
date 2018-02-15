require 'spec_helper'

describe Incredible::Form do
  
  let(:subject) { Incredible::Form.new('form') }
  
  describe 'step_names' do
    
    it 'returns step names' do
      expect(subject.step_names).to match_array(%w[step1 step2])
    end
    
  end
  
end
