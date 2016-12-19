class SearchController < ApplicationController
  def autocomplete
    @search = Searchkick.search(params[:query], {
                               limit: 10,
                               load: false,
                               index_name: [Production, Artist, Venue],
                               misspellings: {below: 5}})
    results = @search.results
    render json: results
  end
end

