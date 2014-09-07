require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  context "valid user" do
    it "should be a valid user" do
      expect(@user.valid?).to eq(true)
    end
  end

    it "should require a name for a valid user" do
      @user.name = ""
      expect(@user.valid?).to eq(false)
    end

    it "should require an email for a valid user" do
      @user.email = ""
      expect(@user.valid?).to eq(false)
    end
end
