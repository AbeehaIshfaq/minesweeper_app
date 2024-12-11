class BoardsController < ApplicationController
    def new
      @board = Board.new
    end
  
    def create
        @board = Board.new(board_params)
        if @board.save
          BoardMailer.board_created(@board).deliver_later
          redirect_to @board, notice: 'Board was successfully created.'
        else
          render :new, status: :unprocessable_entity
        end
    end
      
  
    def show
      @board = Board.find(params[:id])
    end
  
    def index
        @boards = Board.order(created_at: :desc).page(params[:page]).per(2)
    end
  
    private
  
    def board_params
      params.require(:board).permit(:name, :email, :width, :height, :mines)
    end
  end
  