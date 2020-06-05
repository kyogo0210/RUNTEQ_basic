class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_url
    else
      flash[:notice] = 'ログインできませんでした'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'ログアウトしました')
  end
end