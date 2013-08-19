require 'spec_helper'

describe Question do
  describe "a new question" do

    it "should be valid" do
      question = Question.create(
          question_type: 'multiple choice',
          description: 'what is your favorite color?',
          prompt: 'e.g., today I prefer red over blue, I will choose red' )
      question.should be_valid
      question.delete
    end

    it "should not be valid" do
    end

    it "should belong to a survey" do
      survey = Survey.create(name: 'survey1')
      survey.questions.should be_empty
      survey.delete
    end

  end
end
