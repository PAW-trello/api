class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :destroy]
  # GET /boards
  def index
    @boards = current_user.boards
    json_response(@boards)
  end

  # POST /boards
  def create
    @board = current_user.boards.create!(board_params)
    json_response(@board, :created)
  end

  # GET /boards/:id
  def show
    board_list = @board.to_json(include: :lists)
    json_response(board_list)
  end

  # PUT /boards/:id
  def update
    @board.update(board_params)
    head :no_content
  end

  # DELETE /boards/:id
  def destroy
    @board.destroy
    head :no_content
  end

  private

  def board_params
    # whitelist params
    params.permit(:name)
  end

  def set_board
    @board = Board.find(params[:id])
  end

end
