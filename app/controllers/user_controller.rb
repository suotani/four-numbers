class UserController < ApplicationController
  before_action :check_auth

  def check_auth
    redirect_to new_user_session_path unless user_signed_in?
  end
end