require 'spec_helper'

describe User do

  describe "a new user" do
    it "should be valid" do
      user = User.create(name: "user1", email: 'user@user.com', password: 'password')
      user.should be_valid
      user.delete
    end

    it "should not be valid without a name" do
      user = User.create(email: 'user@user.com', password: 'password')
      user.should_not be_valid
    end
  end
end
