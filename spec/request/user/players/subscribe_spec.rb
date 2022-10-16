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

  it "Subscribe Players without sign in" do
    post api_user_player_subscribe_path(team.players.last.id)
    expect(response.status).to eq(401)
  end

  it "Subscribe Player" do
    login
    auth_params = get_auth_params_from_login_response_headers(response)

    post api_user_player_subscribe_path(team.players.last.id), headers: auth_params
    expect(response.status).to eq(201)
  end


  it "Subscribe same player" do
    login
    auth_params = get_auth_params_from_login_response_headers(response)

    post api_user_player_subscribe_path(team.players.last.id), headers: auth_params
    post api_user_player_subscribe_path(team.players.last.id), headers: auth_params

    expect(response.status).to eq(422)
  end
end