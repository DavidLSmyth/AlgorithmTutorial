class InventorsController < ApplicationController
  before_action :set_inventor, only: [:show, :edit, :update, :destroy]

  # GET /inventors
  # GET /inventors.json
  def index
    @inventors = Inventor.all
  end

  # GET /inventors/1
  # GET /inventors/1.json
  def show
  end

  # GET /inventors/new
  def new
    @inventor = Inventor.new
  end

  # GET /inventors/1/edit
  def edit
  end

  # POST /inventors
  # POST /inventors.json
  def create
    @inventor = Inventor.new(inventor_params)

    respond_to do |format|
      if @inventor.save
        format.html { redirect_to @inventor, notice: 'Inventor was successfully created.' }
        format.json { render :show, status: :created, location: @inventor }
      else
        format.html { render :new }
        format.json { render json: @inventor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventors/1
  # PATCH/PUT /inventors/1.json
  def update
    respond_to do |format|
      if @inventor.update(inventor_params)
        format.html { redirect_to @inventor, notice: 'Inventor was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventor }
      else
        format.html { render :edit }
        format.json { render json: @inventor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventors/1
  # DELETE /inventors/1.json
  def destroy
    @inventor.destroy
    respond_to do |format|
      format.html { redirect_to inventors_url, notice: 'Inventor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventor
      @inventor = Inventor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventor_params
      params.require(:inventor).permit(:name, :about, :invention_date, :algorithms)
    end
end
