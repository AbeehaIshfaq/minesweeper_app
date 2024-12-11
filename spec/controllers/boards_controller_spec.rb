require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  let(:valid_attributes) {
    { name: "Test Board", email: "test@example.com", width: 5, height: 5, mines: 5 }
  }

  let(:invalid_attributes) {
    { name: nil, email: "test@example.com", width: 5, height: 5, mines: 5 }
  }

  describe "GET #index" do
    it "returns a success response" do
      Board.create!(valid_attributes)
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      board = Board.create!(valid_attributes)
      get :show, params: { id: board.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Board" do
        expect {
          post :create, params: { board: valid_attributes }
        }.to change(Board, :count).by(1)
      end

      it "redirects to the created board" do
        post :create, params: { board: valid_attributes }
        expect(response).to redirect_to(Board.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Board" do
        expect {
          post :create, params: { board: invalid_attributes }
        }.to change(Board, :count).by(0)
      end

      it "returns an unprocessable_entity response (i.e., displays the form again)" do
        post :create, params: { board: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
      
    end
  end
end
