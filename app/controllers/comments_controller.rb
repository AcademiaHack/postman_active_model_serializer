class CommentsController < ApplicationController
  before_action :find_father, only: [:index, :create]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]


  def index
    if @commentable
      render json: @commentable.try(:comments)
    else
      render json: { text: 'bad request' }
    end
  end

  def create
    if @commentable
      @comment = @commentable.comments.build(comment_params)
      if @comment.save
        render json: @comment
      else
        render json: { text: 'bad request' }
      end
    else
      render json: { text: 'not found' }
    end
  end

  private

  def find_father
    @commentable = if params.key?(:document_id)
                     Document.find_by(id: params[:document_id])
                   elsif params.key?(:section_id)
                     Section.find_by(id: params[:section_id])
                   elsif params.key?(:paragraph_id)
                     Paragraph.find_by(id: params[:paragraph_id])
                   end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
