class Production::StepsController < ApplicationController
  before_action do
    @production = Production.find(params[:production_id])
    @company = @production.company
    authorize @production, :edit?
  end
  include Wicked::Wizard
  steps *Production.form_steps

  def show
    @user = current_user
    @production = Production.find(params[:production_id])
    @showtimes = @production.showtimes
    case step
      when 'duplicate_title'
        unless Production.where(title: @production.title).where.not(company: nil).count > 0
          skip_step
        end
        @duplicates = Production.where(title: @production.title).where.not(id: @production.id, company: nil)
      when 'company'
        if @production.archived?
          skip_step
        end
      when 'duplicate_company'
        if @production.archived?
          skip_step
        else
          unless Company.where(name: @production.company.name).where.not(id: @production.company.id).count > 0
            skip_step
          end
          @duplicates = Company.where(name: @production.company.name).where.not(id: @production.company.id)
        end
      when 'production_dates'
        unless @production.archived?
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
        if p[:company_id] != p[:company_id].to_i.to_s
          c = Company.new
          c.name = p[:company_id]
          if c.save(validate: false)
            @production.company = c
            @production.save(validate: false)
            unless @production.archived?
              p = Permission.new(user: current_user, resource: c)
              p2 = Permission.new(user: current_user, resource: @production)
              p.save
            end
          end
        else
          @production.update!(production_params(step))
        end
      when 'production_dates'
        if p[:"first_performance(2i)"] == ''
          p[:"first_performance(2i)"] = '1'
          p[:"first_performance(3i)"] = '1'
          mask = 4
        elsif p[:"first_performance(3i)"] == ''
          # no day is given, insert a fake day
          p[:"first_performance(3i)"] = '1'
          mask = 6 # 110
        else
          # full-date
          mask = 7 # 111
        end

        @production.update!(p.merge(date_mask: mask))
      when 'production_cast', 'production_creative', 'production_staff', 'production_other'
        @company = @production.company
        if p['credits_attributes'].present?
          pc = p['credits_attributes']
          pc.each do |_, v|
            if v[:stage_name].present? &&
                v[:artist_id].blank?
              a = Artist.new
              a.stage_name = v[:stage_name]
              a.save!(validate: false)
              v[:artist_id] = a.id
            end
            v[:start_date] = Date.strptime(v[:start_date], '%m/%d/%Y')
            v[:end_date] = Date.strptime(v[:end_date], '%m/%d/%Y') if v[:end_date].present?
            v.except!('stage_name')

            if v[:credit_type] == 'staff'
              @company_record = @company.credits.staff.build(artist_id: v[:artist_id],
                                                             position: v[:position],
                                                             start_date: v[:start_date],
                                                             end_date: v[:end_date])
              @company_record.save
            end
          end
          final_credit = p.merge!(credits_attributes: pc)
          @production.update!(final_credit)
        end
      else
        @production.update!(production_params(step))
    end

    %w(production_cast production_creative production_staff production_other).each do |s|
      if current_step? s
        redirect_to wizard_path(s, production_id: @production.id)
        return
      end
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
                             [:first_performance, :last_performance, :date_mask]
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
                           when "production_cast", "production_creative", "production_other", "production_staff"
                             [credits_attributes: [:id,
                                                   :name,
                                                   :position,
                                                   :creditable_id,
                                                   :creditable_type,
                                                   :artist_id,
                                                   :key_credit,
                                                   :start_date,
                                                   :end_date,
                                                   :credit_type,
                                                   :_destroy]]
                             when "production_coproducers"
                               [company_production_links_attributes: [:id,
                                                                      :company_id,
                                                                      :production_id,
                                                                      :_destroy],
                                credits_attributes: [:id,
                                                     :name,
                                                     :position,
                                                     :creditable_id,
                                                     :creditable_type,
                                                     :artist_id,
                                                     :key_credit,
                                                     :start_date,
                                                     :end_date,
                                                     :credit_type,
                                                     :_destroy]]
                             when "production_showtimes"
                               [showtimes_attributes: [:id,
                                                      :theater_id,
                                                      :production_id,
                                                      :showtime,
                                                      :_destroy]]
                           end
    params.require(:production).permit!
  end

end
