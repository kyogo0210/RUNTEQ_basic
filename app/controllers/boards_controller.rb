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
    @boards = Board.includes(:user).all.order(created_at: :desc)
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end
end
