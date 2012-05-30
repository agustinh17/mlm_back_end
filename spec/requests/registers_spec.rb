require 'spec_helper'

describe "User Registration" do
  describe "GET /register" do
    before do
      User.destroy_all
      Identity.destroy_all
    end

    it "should create a new identity and user", :js => true do
      visit(register_path)
      fill_in 'name', :with => 'test'
      fill_in 'email', :with => 'test@test.com'
      fill_in 'password', :with => 'tttttt'
      fill_in 'password_confirmation', :with => 'tttttt'
      fill_in 'company', :with => 'company'
      fill_in 'spouse_name', :with => 'spouse'
      fill_in 'street_address', :with => 'street'
      fill_in 'city', :with => 'city'
      fill_in 'state', :with => 'city'
      fill_in 'zip', :with => 'zip'
      fill_in 'ein', :with => 'ein'
      fill_in 'home_phone', :with => '1111111'
      fill_in 'cell', :with => '1234567890'
      fill_in 'package', :with => 'package-1'
      fill_in 'referred_by', :with => 'test user'
      fill_in 'referer_id', :with => '1'
      click_button "Register"
      Identity.count.should eq(1)
      User.count.should eq(1)
      page.should have_content('Signed in!')
    end
  end
end
