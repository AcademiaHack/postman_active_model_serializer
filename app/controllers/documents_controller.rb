class DocumentsController < ApplicationController
  before_action :find_document, only: [:show, :comments, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @documents = Document.all
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml  { render xml: @documents}
    #   format.json { render json: @documents}
    # end
    render json: @documents
  end

  def show
    render json: @document
  end

  def new
    @document = Document.new
    render json: @document
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      render json: @document
    else
      render json: { text: 'bad request' }
    end
  end

  def edit
    render json: @document
  end

  def update
    if @document.update(document_params)
      render json: @document
    else
      render json: { text: 'bad request' }
    end
  end

  def destroy
    if @document.destroy
      render json: @document
    else
      render json: { text: 'bad request' }
    end
  end

  private

  def find_document
    @document = Document.find_by(id: params[:id])
  end

  def document_params
    params.require(:document).permit(:name, :text)
  end
end
