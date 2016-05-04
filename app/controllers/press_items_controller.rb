class PressItemsController < ApplicationController
  before_action :set_press_item, only: [:show, :edit, :update, :destroy]

  # GET /press_items
  def index
    @press_items = PressItem.all
  end

  # GET /press_items/1
  def show
  end

  # GET /press_items/new
  def new
    @press_item = PressItem.new
  end

  # GET /press_items/1/edit
  def edit
  end

  # POST /press_items
  def create
    @press_item = PressItem.new(press_item_params)

    if @press_item.save
      redirect_to @press_item, notice: 'Press item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /press_items/1
  def update
    if @press_item.update(press_item_params)
      redirect_to @press_item, notice: 'Press item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /press_items/1
  def destroy
    @press_item.destroy
    redirect_to press_items_url, notice: 'Press item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_press_item
      @press_item = PressItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def press_item_params
      params.require(:press_item).permit(:production_id, :date, :publication, :quote, :author, :link)
    end
end
