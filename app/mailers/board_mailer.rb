class BoardMailer < ApplicationMailer
  def board_created(board)
    @board = board
    @url  = board_url(@board)  

    mail(to: @board.email, subject: 'Your Minesweeper Board has been created')
  end
end
