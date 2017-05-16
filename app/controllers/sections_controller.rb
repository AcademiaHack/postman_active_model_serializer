class SectionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    if params.key?(:document_id)
      @document = Document.find_by(id: params[:document_id])
      @sections = if @document
                    @document.sections
                  else
                    { text: 'document not found' }
                  end
    else
      @sections = Section.all
    end
    section
  end

  def highlight
    if params.key?(:document_id)
      @document = Document.find_by(id: params[:document_id])
      @sections = @document.sections
      @section = @sections.update_all(highlight: true)
      # UPDATE "sections" SET "highlight" = 'true' WHERE "sections"."document_id" = $1  [["document_id", 1]]

    else
      @section = Section.find_by(id: params[:id])
      @section = if @section
                   @section.update(highlight: true)
                 else
                   { text: 'section not found' }
                 end
    end
    render json: @section
  end

  def comments
    @section = Section.find_by(id: params[:id])
    @comments = @sections.comments
    render json: @comments
  end

  # {section: {name: "hack", highlight: true }

  def create
    @document = Document.find_by(id: params[:document_id])
    @section = @document.sections.build(section_params)
    if @section.save
      render json: @section
    else
      render json: @section.errors.messages
    end
  end

  def update
    @section = Section.find_by(id: params[:id])
    if @section.update(section_params)
      render json: @section
    else
      render json: {text: 'bad request'}
    end
  end

  private

  # def section_params
  #   params.require(:section).permit(:name, :highlight, paragraph_attributes: ["1" => {},
  #     "2"=> {}])
  # end
  #
  def section_params
    params.require(:section).permit(:name, :highlight)
  end
end

