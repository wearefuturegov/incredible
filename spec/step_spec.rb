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
      rules: {
        name: {
          'Someone' => :next_step,
          'Someone else' => :last_step
        }
      },
      template: 'my_template'
    }
  end
  
  let(:subject) { Incredible::Step.new(hash) }
  
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

  context '#rules' do
    
    it 'returns the rules' do
      expect(subject.rules).to eq(
        name: {
          'Someone' => :next_step,
          'Someone else' => :last_step
        }
      )
    end
    
  end
  
  context '#template' do
    
    it 'returns the template' do
      expect(subject.template).to eq('my_template')
    end
    
  end
  
end
