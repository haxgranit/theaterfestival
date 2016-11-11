module SearchSetup
  extend ActiveSupport::Concern

  private

  def set_production_search
    conditions = params[:conditions] || {'upcoming.someday': true}
    conditions.delete_if { |_,v| v == "0" || v.blank? }
    aggs = ['closing_soon', 'upcoming.today', 'upcoming.tomorrow', 'upcoming.weekend',
            'size.broadway', 'size.offbroadway', 'size.black_box',
           'guaranteed_price']
    if params.try(:[], :search).try(:[], :title).present?
      @productions = Production.search(params[:search][:title],
                                       fields: ['title', 'conditions'],
                                       load: true,
                                       page: params[:page],
                                       per_page: 30,
                                       where: conditions,
                                       aggs: aggs)
    else
      @productions = Production.search('*',
                                       fields: ['title', 'conditions'],
                                       load: true,
                                       page: params[:page],
                                       per_page: 30,
                                       where: conditions,
                                       aggs: aggs)
    end
  end

end
