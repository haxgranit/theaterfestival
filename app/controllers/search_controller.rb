class SearchController < ApplicationController
  def autocomplete
    @search = Searchkick.search(params[:query], {
                               fields: [:name, :title],
                               limit: 10,
                               load: false,
                               index_name: [Production, Artist, Venue, User, Company],
                               misspellings: {below: 5}})
    results = @search.results
    render json: results
  end
end

