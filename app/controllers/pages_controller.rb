class PagesController < ApplicationController
  def home
  end

  def results
    movie_search = params[:query]
    uri = URI("http://www.omdbapi.com/?apikey=#{ENV['OMDB_KEY']}&s=#{movie_search}")
    @movies = JSON.parse(Net::HTTP.get(uri))["Search"].first(5)
  end
end



