require 'rails_helper'
include ActionController::RespondWith

include ControllerHelpers

RSpec.describe "Players dashboard", type: :request do
  let(:user) { create(:user) }
  let(:team) { create(:team, :with_players) }

  before(:each) do
    @current_user = user
    team
  end

  it "Get Players dashboard without sign in" do
    get api_user_dashboard_path
    expect(response.status).to eq(401)
  end

  it "Get Players dashboard with sign in" do
    login
    auth_params = get_auth_params_from_login_response_headers(response)
    post api_user_player_subscribe_path(team.players.last.id), headers: auth_params

    get api_user_dashboard_path, headers: auth_params

    expect(response.status).to eq(200)
    expect(json_body['players'].size).to eq(1)
  end

end