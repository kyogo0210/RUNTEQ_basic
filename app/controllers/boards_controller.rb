class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      flash[:success] = '掲示板を作成しました'
      redirect_to boards_url
    else
      flash[:danger] = '掲示板を作成できませんでした'
      render 'new'
    end
  end

  def index
    @boards = Board.includes(:user).all.order(created_at: :desc)
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image)
  end
end
