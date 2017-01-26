class Festival::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Festival.form_steps

  def show
    @user = current_user
    @festival = Festival.find(params[:festival_id])
    @subtitles = Festival.where(title: @festival.title)
    case step
    when :company
      if @festival.archived?
        jump_to(:festival_data)
      end
    end
    render_wizard
  end

  def update
    @festival = Festival.find(params[:festival_id])
    f = festival_params(step)
    case step
      when "festival_data"
        fp = f[:festival_production_links_attributes]
        fp.each do |k, v|
          if v[:title].present?
            if v[:production_id].blank?
              p = Production.new({title: v[:title], first_performance: Date.today, archived: @festival.archived})
              p.save!(validate: false)
              v[:production_id] = p.id
            end
            fp[k] = v.except(:title)
          end
        end

        f = festival_params(step).merge!(festival_production_links_attributes: fp)
        @festival.update!(f)
      when "festival_staff"
        fc = f[:credits_attributes]
        fc.each do |k, v|
          if v[:stage_name].present?
            if v[:artist_id].blank?
              a = Artist.new({stage_name: v[:stage_name]})
              a.save!(validate: false)
              v[:artist_id] = a.id
            end
            fc[k] = v.except(:stage_name)
          end
        end

        f = festival_params(step).merge!(credits_attributes: fc)
        @festival.update!(f)
      else
        @festival.update!(festival_params(step))
    end
    if past_step? 'company'
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
                               [:title]
                             when "festival_subtitle"
                               [:subtitle]
                             when "company"
                               [:company_id]
                             when "festival_showtimes"
                               [festival_production_link_attributes: []]
                             when "festival_shows"
                               [festival_production_links_attributes: [:title, :production_id, :festival_id, :_destroy]]
                             when "festival_info"
                               [:festival_image, :banner_image, :company_id]
                             when "festival_staff"
                               [credits_attributes: [:id,
                                                     :stage_name,
                                                     :position,
                                                     :creditable_id,
                                                     :creditable_type,
                                                     :artist_id,
                                                     :key_credit,
                                                     :start_date,
                                                     :end_date,
                                                     :credited_as,
                                                     :credit_type,
                                                     :_destroy]]
                           end
    params.require(:festival).permit!
  end

end
