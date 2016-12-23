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
    p = production_params(step)
    case step
      when 'company'
        if p[:company_id].blank?
          c = Company.new
          c.name = params[:company]
          if c.save(validate: false)
            @production.company = c
            @production.save(validate: false)
          end
        else
          @production.update!(production_params(step))
        end
      when 'production_cast', 'production_creative'
        if p['credits_attributes'].present?
          pc = p['credits_attributes']
          pc.each do |k, v|
            if params[:stage_name].present? &&
                pc[k][:artist_id].blank?
              a = Artist.new
              a.stage_name = params[:stage_name]
              a.save!(validate: false)
              pc[k][:artist_id] = a.id
            end
          end
          final_credit = p.merge!(credits_attributes: pc)
          @production.update!(final_credit)
        end
      when 'production_coproducers'
        if p['company_production_links_attributes'].present?
          pc = p['company_production_links_attributes']
          pc.each do |k,v|
            if params[:company].present? &&
                pc[k][:company_id].blank?
              c = Company.new
              c.name = params[:company]
              c.save!(validate: false)
              pc[k][:company_id] = c.id
              pc[k][:production_id] = @production.id
            end
          end
          final_company = p.merge!(company_production_links_attributes: pc)
          @production.update!(final_company)
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
                             when "production_coproducers"
                               [company_production_links_attributes: [:id, :company_id, :production_id, :_destroy]]
                             when "production_showtimes"
                               [showtimes_attributes: [:id,
                                                      :theater_id,
                                                      :production_id,
                                                      :showtime,
                                                      :_destroy]]
                           end
    params.require(:production).permit(permitted_attributes).merge(form_step: step)
  end

end
