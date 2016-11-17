class TagsController < ApplicationController
	before_action :set_tag, only: [:show, :edit, :update]
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    #@tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @algorithms = Algorithm.tagged_with(@tag.name)
  end

	def edit
  end
	def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tag_url(@tag), notice: 'Algorithm was successfully updated.' }
        format.json { render :show, status: :ok, location: @algorithm }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:acts_as_taggable_on_tag).permit(:name,:description)
    end
end
