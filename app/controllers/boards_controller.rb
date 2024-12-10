class BoardsController < ApplicationController
    def new
      @board = Board.new
    end
  
    def create
      @board = Board.new(board_params)
      @board.generate_board
      if @board.save
        redirect_to @board
      else
        render :new
      end
    end
  
    def show
      @board = Board.find(params[:id])
    end
  
    def index
      @boards = Board.all.order(created_at: :desc)
    end
  
    private
  
    def board_params
      params.require(:board).permit(:name, :email, :width, :height, :mines)
    end
  end
  