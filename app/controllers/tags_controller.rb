class TagsController < ApplicationController
	before_action :set_tag, only: [:show, :edit]
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    #@tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @algorithms = Algorithm.tagged_with(@tag.name)
  end

	def edit
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name,:description)
    end
end
