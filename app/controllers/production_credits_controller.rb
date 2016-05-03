class ProductionCreditsController < ApplicationController
  before_action :set_production_credit, only: [:show, :edit, :update, :destroy]

  # GET /production_credits
  def index
    @production_credits = ProductionCredit.all
  end

  # GET /production_credits/1
  def show
  end

  # GET /production_credits/new
  def new
    @production_credit = ProductionCredit.new
  end

  # GET /production_credits/1/edit
  def edit
  end

  # POST /production_credits
  def create
    @production_credit = ProductionCredit.new(production_credit_params)

    if @production_credit.save
      redirect_to @production_credit, notice: 'Production credit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /production_credits/1
  def update
    if @production_credit.update(production_credit_params)
      redirect_to @production_credit, notice: 'Production credit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /production_credits/1
  def destroy
    @production_credit.destroy
    redirect_to production_credits_url, notice: 'Production credit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_credit
      @production_credit = ProductionCredit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def production_credit_params
      params.require(:production_credit).permit(:artist_id, :production_id, :name, :position, :start_date, :end_date, :type, :confirmed)
    end
end
