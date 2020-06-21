class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = 'ログインしました'
      redirect_back_or_to boards_url
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end
end
