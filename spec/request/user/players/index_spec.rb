require 'rails_helper'
include ActionController::RespondWith

include ControllerHelpers

RSpec.describe "Players Index", type: :request do
  let(:user) { create(:user) }
  let(:team) { create(:team, :with_players) }

  before(:each) do
    @current_user = user
    team
  end

  it "Get Players without sign in" do
    get api_user_players_path
    expect(response.status).to eq(401)
  end

  it "Get Players with sign in" do
    login
    auth_params = get_auth_params_from_login_response_headers(response)

    get api_user_players_path, headers: auth_params
    expect(response.status).to eq(200)
    expect(json_body['players_count']).to eq(4)
  end

end