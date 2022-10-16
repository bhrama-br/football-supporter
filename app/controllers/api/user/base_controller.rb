class Api::User::BaseController < ApplicationController
  before_action :authenticate_api_user!
end
  