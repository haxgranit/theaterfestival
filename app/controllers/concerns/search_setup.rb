module SearchSetup
  extend ActiveSupport::Concern

  private

  def set_production_search
    conditions = params[:conditions] || {'upcoming.someday': true}
    conditions.delete_if { |_,v| v == "0" || v.blank? }
    if session[:geo_location].present?
      loc = session[:geo_location]
      conditions[:location] = { near: [loc.lat, loc.lng], within: '25mi'  }
    end
    aggs = ['closing_soon', 'upcoming.today', 'upcoming.tomorrow', 'upcoming.weekend',
            'size.broadway', 'size.offbroadway', 'size.black_box',
           'guaranteed_price']
    @productions = Production.search('*',
                                     fields: ['title', 'conditions'],
                                     load: true,
                                     page: params[:page],
                                     per_page: 30,
                                     where: conditions,
                                     aggs: aggs)
  end

end
