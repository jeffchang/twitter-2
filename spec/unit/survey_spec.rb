require 'spec_helper'

describe Survey do

  describe "a new survey" do
    it "should be valid" do
      survey = Survey.create(name: 'survey1')
      survey.should be_valid
      survey.delete
    end

    it "should not be valid without a name" do
      survey = Survey.create()
      survey.should_not be_valid
      survey.delete
    end

    it "should belong to a user" do
      user = User.create(name: "user1", email: 'user@user.com', password: 'password')
      user.surveys.should be_empty
      user.delete
    end

  end
end
