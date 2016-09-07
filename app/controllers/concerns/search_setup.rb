module SearchSetup
  extend ActiveSupport::Concern

  private

  def set_production_search
    aggs = [:today, :tomorrow, :weekend]
    if params.try(:[], :search).try(:[], :title).present?
      @productions = Production.search(params[:search][:title],
                                       fields: ['title'],
                                       load: true,
                                       page: params[:page],
                                       per_page: 9)
    else
      @productions = Production.search('*',
                                       fields: ['title'],
                                       load: true,
                                       page: params[:page],
                                       per_page: 9)
    end
  end

end
