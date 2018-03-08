require 'spec_helper'

describe Incredible::Step do
  
  let(:hash) do
    {
      questions: [
        {
          name: 'Your Name',
          widget: 'text'
        }
      ],
      template: 'my_template'
    }
  end
  
  let(:subject) { Incredible::Step.new('rule', hash) }
  
  context '#questions' do
    
    it 'returns the questions' do
      expect(subject.questions).to eq(
        [
          {
            name: 'Your Name',
            widget: 'text'
          }
        ]
      )
    end
    
  end

  context '#rule' do
    
    context 'when a rule is not present' do
      
      before do
        Object.send(:remove_const, :RuleRule) if defined?(RuleRule)
      end
    
      it 'returns nil' do
        expect(subject.rule).to eq(nil)
      end
      
    end
    
    context 'when a rule is present' do
      
      before do
        Object.const_set('RuleRule', Class.new)
      end
    
      it 'returns the rule' do
        expect(subject.rule).to eq(RuleRule)
      end
      
    end
    
  end
  
  context '#template' do
    
    it 'returns the template' do
      expect(subject.template).to eq('my_template')
    end
    
  end
  
end
