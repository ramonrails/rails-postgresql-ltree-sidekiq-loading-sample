class LtreeFilesController < ApplicationController
  before_action :set_ltree_file, only: [:show, :edit, :update, :destroy]

  # GET /ltree_files
  # GET /ltree_files.json
  def index
    @ltree_files = LtreeFile.all
  end

  # GET /ltree_files/1
  # GET /ltree_files/1.json
  def show
  end

  # GET /ltree_files/new
  def new
    @ltree_file = LtreeFile.new
  end

  # GET /ltree_files/1/edit
  def edit
  end

  # POST /ltree_files
  # POST /ltree_files.json
  def create
    @ltree_file = LtreeFile.new(ltree_file_params)

    respond_to do |format|
      if @ltree_file.save
        format.html { redirect_to ltree_files_path, notice: 'Ltree file was successfully created.' }
        format.json { render :show, status: :created, location: @ltree_file }
      else
        format.html { render :new }
        format.json { render json: @ltree_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ltree_files/1
  # PATCH/PUT /ltree_files/1.json
  def update
    respond_to do |format|
      if @ltree_file.update(ltree_file_params)
        format.html { redirect_to @ltree_file, notice: 'Ltree file was successfully updated.' }
        format.json { render :show, status: :ok, location: @ltree_file }
      else
        format.html { render :edit }
        format.json { render json: @ltree_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ltree_files/1
  # DELETE /ltree_files/1.json
  def destroy
    @ltree_file.destroy
    respond_to do |format|
      format.html { redirect_to ltree_files_url, notice: 'Ltree file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ltree_file
      @ltree_file = LtreeFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ltree_file_params
      params.require(:ltree_file).permit(:name, :process_at, :path, :uploaded_file)
    end
end
