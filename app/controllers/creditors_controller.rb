class CreditorsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_creditor, only: [:show, :edit, :update, :destroy]

  # GET /creditors
  # GET /creditors.json
  def index
    @creditors = current_user.creditors
  end

  # GET /creditors/1
  # GET /creditors/1.json
  def show
  end

  # GET /creditors/new
  def new
    @creditor = Creditor.new
  end

  # GET /creditors/1/edit
  def edit
  end

  # POST /creditors
  # POST /creditors.json
  def create
    @creditor = Creditor.new(creditor_params)
    @creditor.user = current_user
    respond_to do |format|
      if @creditor.save
        format.html { redirect_to @creditor, notice: 'Creditor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @creditor }
      else
        format.html { render action: 'new' }
        format.json { render json: @creditor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creditors/1
  # PATCH/PUT /creditors/1.json
  def update
    respond_to do |format|
      if @creditor.update(creditor_params)
        format.html { redirect_to @creditor, notice: 'Creditor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @creditor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creditors/1
  # DELETE /creditors/1.json
  def destroy
    @creditor.destroy
    respond_to do |format|
      format.html { redirect_to creditors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creditor
      @creditor = current_user.creditors.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creditor_params
      params.require(:creditor).permit(:name, :amount, :description)
    end
end
