class Api::Admin::BaseController < ApplicationController
  before_action :authenticate_api_admin!
end
  