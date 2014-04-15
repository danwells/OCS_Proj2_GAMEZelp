require 'spec_helper'

describe "Sites" do
  
  describe "GET /sites" do
    it "works! (now write some real specs)" do
      @curr_user = User.create(fname: "default", lname: "user", email: "nobody@some.email", password: "pass")
      visit sites_path
      expect(page).to have_content("GAMEZelp")
      # response.status.should be(200)
    end
  end
  
end
