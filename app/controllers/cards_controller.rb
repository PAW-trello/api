class CardsController < ApplicationController
  before_action :set_list
  before_action :set_list_card, only: [:show, :update, :destroy]

  # GET /boards/:board_id/lists/:list_id/cards
  def index
    @cards = @list.cards
    json_response(@cards)
  end

  # POST /lists/:list_id/cards
  def create
    card = @list.cards.create!(card_params)
    json_response(card, :created)
  end

  # GET /lists/:list_id/cards/:id
  def show
    json_response(@card)
  end

  # PUT /lists/:list_id/cards/:id
  def update
    @card.update(card_params)
    head :no_content
  end

  # DELETE /lists/:list_id/cards/:id
  def destroy
    @card.destroy
    head :no_content
  end

  private
  def card_params
    # whitelist params
    params.permit(:title, :description, :label)
  end

  def set_list
    @list = List.find(params[:list_id])
  end


  def set_list_card
    @card = @list.cards.find_by!(id: params[:id]) if @list
  end
end
