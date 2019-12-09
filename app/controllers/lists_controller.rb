# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :set_board, only: [:show, :update, :destroy, :index, :create]
  before_action :set_board_list, only: [:show, :update, :destroy]

  # GET /boards/:board_id/lists
  def index
    json_response(@board.lists)
  end

  # GET /boards/:board_id/lists/:id
  def show
    json_response(@list)
  end

  # POST /boards/:board_id/lists
  def create
    list = @board.lists.create!(list_params)
    json_response(list, :created)
  end

  # PUT /boards/:board_id/lists/:id
  def update
    @list.update(list_params)
    head :no_content
  end

  # DELETE /borads/:board_id/lists/:id
  def destroy
    @list.destroy
    head :no_content
  end

  def swap
    list = List.find(params[:id])
    from = list.display_order
    to = params[:to]
    if from > to
      lists = List.where("display_order between  ? and ?", to, from - 1)
      lists.each do |l|
        l.update!(display_order: l.display_order + 1)
      end
      list.update(display_order: to)
      json_response(list.board.lists)
    else 
      lists = List.where("display_order between  ? and ?", from + 1, to)
      lists.each do |l|
        l.update!(display_order: l.display_order - 1)
      end
      list.update(display_order: to)
      json_response(list.board.lists)
    end 
  end

  private
  def list_params
    params.permit(:title)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_board_list
    @list = @board.lists.find_by!(id: params[:id]) if @board
  end
end
