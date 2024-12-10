class BoardsController < ApplicationController
    def new
      @board = Board.new
    end
  
    def create
        @board = Board.new(board_params)
        Rails.logger.debug "Attempting to save board..."
        if @board.save
          redirect_to @board, notice: 'Board was successfully created.'
        else
          Rails.logger.debug "Validation failed: #{@board.errors.full_messages.join(", ")}"
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
  