require 'spec_helper'

describe WelcomeController do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      response.should be_success
      response.code.should eq "200"
    end
  end

end
