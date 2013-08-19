require 'spec_helper'

describe ResponseChoice do
  describe "a new response choice" do

    it "should be valid" do
      response_choice = ResponseChoice.create(value: 'option1')
      response_choice.should be_valid
      response_choice.delete
    end

    it "should not be valid" do
      response_choice1 = ResponseChoice.create(value: 'option1')
      response_choice2 = ResponseChoice.create(value: 'option1')
      response_choice2.should_not be_valid

      response_choice1.delete
      response_choice2.delete

    end

    it "should belong to a question" do
      question = Question.create(
          question_type: 'multiple choice',
          description: 'what is your favorite color?',
          prompt: 'e.g., today I prefer red over blue, I will choose red' )
      r = ResponseChoice.create(value: 'red')
      g = ResponseChoice.create(value: 'green')
      b = ResponseChoice.create(value: 'blue')

      question.response_choices << r
      question.response_choices << g
      question.response_choices << b

      question.response_choices.size.should == 3
      question.delete
      r.delete; g.delete; b.delete
    end

  end
end
