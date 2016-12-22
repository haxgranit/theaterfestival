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
    case step
      when :company
        if production_params(step)[:company_id].blank?
          c = Company.new
          c.name = params[:company]
          if c.save(validate: false)
            @production.company = c
            @production.save(validate: false)
          end
        end
      when 'production_cast', 'production_creative'
        if production_params(step)['credits_attributes'].present?
          pc = production_params(step)['credits_attributes']
          pc.each do |k, v|
            if params[:stage_name].present? &&
                pc[k][:artist_id].blank?
              a = Artist.new
              a.stage_name = params[:stage_name]
              a.save!(validate: false)
              pc[k][:artist_id] = a.id
            end
          end
          final_credit = production_params(step).merge!(credits_attributes: pc)
          @production.update!(final_credit)
        end
      else
        @production.update!(production_params(step))
    end


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
                             [:key_image, :banner_image, :tagline,
                              :description,
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
                           when "production_cast", "production_creative"
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
