require 'rails_helper'
include ActionController::RespondWith

include ControllerHelpers

# The authentication header looks something like this:
# {"access-token"=>"abcd1dMVlvW2BT67xIAS_A", "token-type"=>"Bearer", "client"=>"LSJEVZ7Pq6DX5LXvOWMq1w", "expiry"=>"1519086891", "uid"=>"darnell@konopelski.info"}

describe 'Whether access is ocurring properly Admin', type: :request do
  let(:admin) { create(:admin) }

  before(:each) do
    @current_admin = admin
  end

  context 'context: general authentication via API, ' do
    it "doesn't give you anything if you don't log in" do
      get api_admin_players_path()
      expect(response.status).to eq(401)
    end

    it 'gives you a status 200 on signing in ' do
      login_admin
      expect(response.status).to eq(200)
    end
  end
end