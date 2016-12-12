module SearchSetup
  extend ActiveSupport::Concern

  private

  def set_production_search
    c = params[:conditions] || {}
    conditions = {'upcoming.someday': true}
    conditions.delete_if { |_,v| v == "0" || v.blank? }
    if c['showtimes.venue.city'].present? || c['showtimes.venue.state'].present? || c['showtimes.venue.zip'].present?
      city, state, zip = c['showtimes.venue.city'], c['showtimes.venue.state'], c['showtimes.venue.zip']
      loc = Geokit::Geocoders::MultiGeocoder.geocode("#{city}, #{state} #{zip}")
      if loc.success
        conditions[:location] = { near: [loc.lat, loc.lng], within: '25mi'  }
      end
    elsif session[:geo_location].present?
      loc = session[:geo_location]
      if loc.present?
        conditions[:location] = { near: [loc.lat, loc.lng], within: '25mi'  }
      end
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
