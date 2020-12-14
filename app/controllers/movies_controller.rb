class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    movie_id = params[:movie_id]
    uri = URI("http://www.omdbapi.com/?apikey=#{ENV['OMDB_KEY']}&i=#{movie_id}")
    movie_information = JSON.parse(Net::HTTP.get(uri))
    movie = Movie.create!(attribute_converter(movie_information))
    redirect_to movies_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movie_path(@movie)
  end

  private

  def attribute_converter(movie_information)
    { title: movie_information["Title"],
      genre: movie_information["Genre"],
      year: movie_information["Year"],
      language: movie_information["Language"],
      plot: movie_information["Plot"],
      poster: movie_information["Poster"],
      rating: movie_information["imdbRating"],
      director: movie_information["Director"],
      actors: movie_information["Actors"]
    }
  end

  def movie_params
    params.require(:movie).permit(:title, :rating, :genre, :actors, :director, :year, :plot, :language, :poster)
  end
end
