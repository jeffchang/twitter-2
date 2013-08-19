require 'spec_helper'

describe Reply do
  describe "a new response" do

    it "should be valid" do
      reply = Reply.create(value: 'blue')
      reply.should be_valid
      reply.delete
    end

    it "should not be valid" do
    end

    it "should belong to a question" do
      question = Question.create(
          question_type: 'multiple choice',
          description: 'what is your favorite color?',
          prompt: 'e.g., today I prefer red over blue, I will choose red' )
      vermilion = Reply.create(value: 'my favorite color today is vermilion')
      question.replies << vermilion

      question.replies.first.value.should == vermilion.value
      question.delete
      vermilion.delete
    end

    it "should belong to a user" do
      user = User.create(name: "user1", email: 'user@user.com', password: 'password')
      user.replies.should be_empty
      user.delete
    end

  end
end
