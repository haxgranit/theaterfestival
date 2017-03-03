class SearchController < ApplicationController
  def autocomplete
    @search = Searchkick.search(params[:query], {
                               fields: [:name],
                               limit: 10,
                               load: false,
                               index_name: [Production, Artist, Venue, User],
                               misspellings: {below: 5}})
    results = @search.results
    render json: results
  end
end

