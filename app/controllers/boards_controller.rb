class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    @board.save
  end

  def index
    @boards = Board.includes(:user).all
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end

  def require_login
    redirect_to login_url unless logged_in?
    flash[:danger] = 'ログインしてください'
  end
end
