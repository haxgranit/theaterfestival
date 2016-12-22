module SearchSetup
  extend ActiveSupport::Concern

  private

  def set_production_search
    c = params[:conditions] || {}
    conditions = {'upcoming.someday': true}
    c.delete_if { |_,v| v == "0" || v.blank? }

    no_search = c.empty?

    if c['showtimes.venue.city'].present? || c['showtimes.venue.state'].present? || c['showtimes.venue.zip'].present?
      @city, @state, @zip = c['showtimes.venue.city'], c['showtimes.venue.state'], c['showtimes.venue.zip']
      @city = '' if @city.blank?
      @state = '' if @state.blank?
      @zip = '' if @zip.blank?
      loc = Geokit::Geocoders::MultiGeocoder.geocode("#{@city}, #{@state} #{@zip}")
      if loc.success
        conditions[:location] = { near: [loc.lat, loc.lng], within: '25mi'  }
      end
    elsif session[:geo_location].present?
      loc = session[:geo_location]
      if loc.present?
        conditions[:location] = { near: [loc.lat, loc.lng], within: '25mi'  }
      end
    end
    if c[:favorites].present?
      sort = { likes: :desc }
    end
    c.except!('showtimes.venue.city', 'showtimes.venue.state', 'showtimes.venue.zip', :favorites)

    conditions.merge!(c)

    aggs = ['closing_soon', 'upcoming.today', 'upcoming.tomorrow', 'upcoming.weekend',
            'size.broadway', 'size.offbroadway', 'size.black_box',
           'guaranteed_price']

    if no_search
      @productions = Searchkick.search('*',
                                       fields: ['title'],
                                       load: true,
                                       index_name: [Production,Festival],
                                       page: params[:page],
                                       per_page: 30,
                                       execute: false,
                                       where: {festivals: nil}.merge(conditions),
                                       aggs: aggs)
    else
      @productions = Production.search('*',
                                       fields: ['title', 'conditions'],
                                       load: true,
                                       page: params[:page],
                                       per_page: 30,
                                       execute: false,
                                       where: conditions,
                                       order: sort,
                                       aggs: aggs)
    end
  end

end
