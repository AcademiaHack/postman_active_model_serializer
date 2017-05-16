class DocumentsController < ApplicationController
  before_action :find_document, only: [:show, :comments]

  def index
    @documents = Document.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @documents}
      format.json { render json: @documents}
    end
  end

  def show
    render json: @document
  end

  def new
    render json: {text: :ok}
  end

  def comments
    @comments = @document.comments
    render json: @comments
  end

  def create
    # params
    # request
    # response
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_document
    @document = Document.find(params[:id])
  end
end
