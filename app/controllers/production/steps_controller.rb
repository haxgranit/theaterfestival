class Production::StepsController < ApplicationController
  before_action do
    @production = Production.find(params[:production_id])
    authorize @production, :claim?
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
              v.except!(:stage_name)
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
      when 'production_showtimes'
        if p['showtimes_attributes'].present?
          pc = p['showtimes_attributes']
          pc.each do |k,v|
            if pc[k][:theater_placeholder].present?
              if pc[k][:theater_placeholder][:venue].present?
                if pc[k][:theater_placeholder][:venue_id].blank?
                  c = Venue.new
                  c.name = pc[k][:theater_placeholder][:venue]
                  c.address = pc[k][:theater_placeholder][:address]
                  c.save!(validate: false)
                  t = Theater.new
                  t.name = pc[k][:theater_placeholder][:venue]
                  t.venue = c
                  t.save!(validate: false)
                  pc[k][:theater_id] = t.id
                end
              end
            end
          end
          pc.each do |_, v|
            v.except!(:theater_placeholder)
          end
          final_company = p.merge!(showtimes_attributes: pc)
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
                           when "production_cast", "production_creative", "production_other"
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
