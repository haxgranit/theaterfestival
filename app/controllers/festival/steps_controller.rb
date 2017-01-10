class Festival::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Festival.form_steps

  def show
    @user = current_user
    @festival = Festival.find(params[:festival_id])
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
      when "festival_shows"
        fp = f[:festival_production_links_attributes]
        updated = fp.each do |k, v|
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
      else
        @festival.update!(festival_params(step))
    end
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
                               [:title]
                             when "festival_subtitle"
                               [:subtitle]
                             when "company"
                               [:company_id]
                             when "festival_shows"
                               [festival_production_links_attributes: [:title, :production_id, :festival_id, :_destroy]]
                             when "festival_info"
                               [:festival_image, :banner_image, :company_id]
                           end
    params.require(:festival).permit(permitted_attributes).merge(form_step: step)
  end

end
