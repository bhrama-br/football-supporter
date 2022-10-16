require 'rails_helper'
include ActionController::RespondWith

include ControllerHelpers

RSpec.describe "Player show", type: :request do
  let(:user) { create(:user) }
  let(:team) { create(:team, :with_players) }

  before(:each) do
    @current_user = user
    team
  end

  it "Show Players without sign in" do
    get api_user_player_path(team.players.last.id)
    expect(response.status).to eq(401)
  end

  it "Show Player" do
    login
    auth_params = get_auth_params_from_login_response_headers(response)
    get api_user_player_path(team.players.last.id), headers: auth_params
    expect(response.status).to eq(200)
  end
end