class QwernsController < ApplicationController
  before_action :set_qwern, only: [:show, :edit, :update, :destroy]

  # GET /qwerns
  # GET /qwerns.json
  def index
    @qwerns = Qwern.all
  end

  # GET /qwerns/1
  # GET /qwerns/1.json
  def show
  end

  # GET /qwerns/new
  def new
    @qwern = Qwern.new
  end

  # GET /qwerns/1/edit
  def edit
  end

  # POST /qwerns
  # POST /qwerns.json
  def create
    @qwern = Qwern.new(qwern_params)

    respond_to do |format|
      if @qwern.save
        format.html { redirect_to @qwern, notice: 'Qwern was successfully created.' }
        format.json { render :show, status: :created, location: @qwern }
      else
        format.html { render :new }
        format.json { render json: @qwern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qwerns/1
  # PATCH/PUT /qwerns/1.json
  def update
    respond_to do |format|
      if @qwern.update(qwern_params)
        format.html { redirect_to @qwern, notice: 'Qwern was successfully updated.' }
        format.json { render :show, status: :ok, location: @qwern }
      else
        format.html { render :edit }
        format.json { render json: @qwern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qwerns/1
  # DELETE /qwerns/1.json
  def destroy
    @qwern.destroy
    respond_to do |format|
      format.html { redirect_to qwerns_url, notice: 'Qwern was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qwern
      @qwern = Qwern.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qwern_params
      params.require(:qwern).permit(:name, :bio, :birthday)
    end
end
