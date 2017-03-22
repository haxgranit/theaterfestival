class CreditsController < ApplicationController
  
  before_action :set_credit, only: [:show, :edit, :update, :destroy]

  include Socialization::Actions

  def destroy
    @credit.destroy
    redirect_to :back, notice: 'Production was successfully destroyed.'
  end


  private
  def set_credit
    @credit = Credit.find(params[:id])
  end
end
