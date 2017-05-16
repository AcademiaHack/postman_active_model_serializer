class CommentsController < ApplicationController
  def index
    @commentable =  case 'params'
                    when params.key?(:document_id)
                      Document.find_by(id: params[:id])
                    when params.key?(:section_id)
                      Section.find_by(id: params[:id])
                    end

    render json: @commentable.try(:comments)
  end
end
