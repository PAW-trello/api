class CommentsController < ApplicationController
  before_action :set_card
  before_action :set_card_comment, only: [:show, :update, :destroy]

  # GET /cards/:card_id/comments
  def index
    @comments = @card.comments
    json_response(@comments)
  end

  # POST /cards/:card_id/comments
  def create
    comments = @card.comments.create!(comment_params)
    json_response(comments, :created)
  end

  # GET /cards/:card_id/comments/:id
  def show
    json_response(@comment)
  end

  # PUT /cards/:card_id/comments/:id
  def update
    @comment.update(card_params)
    head :no_content
  end

  # DELETE /cards/:card_id/comments/:id
  def destroy
    @comment.destroy
    head :no_content
  end

  private
  def comment_params
    # whitelist params
    params.permit(:title, :message)
  end

  def set_card
    @card = Card.find(params[:card_id])
  end


  def set_card_comment
    @comment = @card.comments.find_by!(id: params[:id]) if @card
  end
end
