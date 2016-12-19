class Festival::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Festival.form_steps

  def show
    @user = current_user
    @festival = Festival.find(params[:festival_id])
    case step
    when :company
      if @festival.archived?
        skip_step
      end
    end
    render_wizard
  end

  def update
    @festival = Festival.find(params[:festival_id])
    @festival.update(festival_params(step))
    if past_step? 'festival_data'
      redirect_to wizard_path('festival_data', festival_id: @festival.id)
    else
      render_wizard @festival
    end
  end

  private

  def festival_params(step)
    permitted_attributes = case step
                           when "timing"
                             [:archived]
                           when "festival_title"
                             [:title, :subtitle]
                           when "company"
                             [:company_id]
                           when "festival_info"
                             [:festival_image, :banner_image, :company_id]
                           end
    params.require(:festival).permit(permitted_attributes).merge(form_step: step)
  end

end
