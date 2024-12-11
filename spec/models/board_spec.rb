require 'rails_helper'

RSpec.describe Board, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      board = Board.new(
        name: "Test Board",
        email: "test@example.com",
        width: 5,
        height: 5,
        mines: 5
      )
      expect(board).to be_valid
    end

    it 'is not valid without a name' do
      board = Board.new(name: nil)
      expect(board).to_not be_valid
    end

    it 'is not valid if mines exceed available cells' do
      board = Board.new(
        name: "Test Board",
        email: "test@example.com",
        width: 2,
        height: 2,
        mines: 5
      )
      expect(board).to_not be_valid
    end
    
    it 'is not valid without width or height' do
        board = Board.new(
          name: "Test Board",
          email: "test@example.com",
          width: nil,
          height: nil,
          mines: 5
        )
        expect(board).to_not be_valid
    end
      

    it 'is not valid with a width or height less than 1' do
      board = Board.new(
        name: "Test Board",
        email: "test@example.com",
        width: 0,
        height: 2,
        mines: 1
      )
      expect(board).to_not be_valid
    end
  end

  context 'callbacks' do
    it 'generates the grid on creation' do
      board = Board.create(
        name: "Test Board",
        email: "test@example.com",
        width: 5,
        height: 5,
        mines: 5
      )
      expect(board.grid).to be_an_instance_of(Array)
      expect(board.grid.length).to eq(5)
      expect(board.grid.first.length).to eq(5)
    end
  end
end
