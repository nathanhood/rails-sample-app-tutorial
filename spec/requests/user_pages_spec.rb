require 'spec_helper'

describe "UserPages" do

  subject { page }

  context "signup page" do
    before { visit signup_path }

    it { should have_content('Sign Up') }
    it { should have_title('Sign Up') }
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    context "with invalid information" do
      it "should not create a user" do
        expect{ click_button submit }.not_to change(User, :count)
      end

      context "after submission" do
        before { click_button submit }

        it { should have_content('error') }
        # it { should have_title('Sign up') }
      end
    end

    context "with valid information" do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "example@user.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create a user" do
        expect{ click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  context "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
end
