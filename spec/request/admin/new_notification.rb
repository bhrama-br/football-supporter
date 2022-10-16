require 'rails_helper'
include ActionController::RespondWith

include ControllerHelpers

RSpec.describe "New notification", type: :request do
  let(:admin) { create(:admin) }
  let(:team) { create(:team, :with_players) }

  before(:each) do
    @current_admin = admin
    team
  end

  it "New Msg with sign in" do
    login_admin
    auth_params = get_auth_params_from_login_response_headers(response)

    post api_admin_player_notification_path(team.players.last.id), params: {message: 'test'},headers: auth_params
    
    expect(response.status).to eq(201)
  end

  it "Edit Msg with sign in" do
    login_admin
    auth_params = get_auth_params_from_login_response_headers(response)
    @player = team.players.last
    post api_admin_player_notification_path(@player.id), params: {message: 'test'},headers: auth_params
    put api_admin_edit_notification_path(@player.notifications.last), params: {message: 'test2'},headers: auth_params
    
    expect(response.status).to eq(200)
  end

  it "Delete Msg with sign in" do
    login_admin
    auth_params = get_auth_params_from_login_response_headers(response)
    @player = team.players.last
    post api_admin_player_notification_path(@player.id), params: {message: 'test'},headers: auth_params
    delete api_admin_delete_notification_path(@player.notifications.last),headers: auth_params
    
    expect(response.status).to eq(200)
  end
end