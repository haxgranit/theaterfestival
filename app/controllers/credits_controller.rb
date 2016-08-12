class CreditsController < ApplicationController
  before_action :set_credit, only: [:show, :edit, :update, :destroy]

  # GET /production_credits
  def index
    model = get_model(params[:type])
    @model = model.all
  end

  # GET /production_credits/1
  def show
  end

  # GET /production_credits/new
  def new
    model = get_model(params[:type])

    @model = model.new
  end

  # GET /production_credits/1/edit
  def edit
  end

  # POST /production_credits
  def create
    model = get_model(params[:type])
    @model = model.new(model_params)

    if @model.save
      @model.create_activity :create, owner: @model.artist, recipient: @model.production
      redirect_to @model, notice: 'Credit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /production_credits/1
  def update
    model = get_model(params[:type])

    if model.update(model_params)
      redirect_to @model, notice: 'Credit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /production_credits/1
  def destroy
    model = get_model(params[:type])

    model.destroy(params[:id])
    redirect_to polymorphic_path(model), notice: 'Credit was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def get_model(type)
    type.constantize
  end

  def set_credit
    model = get_model(params[:type])

    @model = model.find(params[:id])
  end


  # Only allow a trusted parameter "white list" through.
  def model_params
    params
      .require(params[:type].underscore.to_sym)
      .permit(:artist_id,
              :production_id,
              :position,
              :start_date,
              :end_date,
              :type,
              :confirmed)
  end
end
