class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def no_authenticated
    flash[:danger] = 'ログインしてください'
    redirect_to login_url
  end
end
