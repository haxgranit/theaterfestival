class Production::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Production.form_steps

  def show
    @user = current_user
    @production = Production.find(params[:production_id])
    case step
    when :company
      if @production.archived?
        skip_step
      end
    end
    render_wizard
  end

  def update
    @production = Production.find(params[:production_id])
    @production.update(production_params(step))
    if past_step? 'production_data'
      redirect_to wizard_path('production_data', production_id: @production.id)
    else
      render_wizard @production
    end
  end

  private

  def production_params(step)
    permitted_attributes = case step
                           when "timing"
                             [:archived]
                           when "production_title"
                             [:title]
                           when "company"
                             [:company_id]
                           when "production_dates"
                             [:first_performance, :last_performance]
                           when "production_info"
                             [:key_image, :banner_image, :company_id,
                             production_metadata_attributes: [:id,
                                                 :performance_type,
                                                 :info_heading,
                                                 :info,
                                                 :warnings,
                                                 :warning_info,
                                                 :running_time,
                                                 :intermissions,
                                                 :recommended_age,
                                                 :website]]
                           when "production_people"
                             [credits_attributes: [:id,
                                                   :name,
                                                   :position,
                                                   :creditable_id,
                                                   :creditable_type,
                                                   :artist_id,
                                                   :start_date,
                                                   :end_date,
                                                   :credited_as,
                                                   :credit_type,
                                                   :_destroy]]
                           end
    params.require(:production).permit(permitted_attributes).merge(form_step: step)
  end

end
