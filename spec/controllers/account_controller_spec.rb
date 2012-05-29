require 'spec_helper'

describe AccountController do

  describe "GET 'myaccount'" do
    it "returns http success" do
      get 'myaccount'
      response.should be_success
    end
  end

end
