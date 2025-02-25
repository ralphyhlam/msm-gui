class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def add_movie
    @user_movie = Movie.new
    @user_movie.title = params.fetch("user_movie_title")
    @user_movie.year = params.fetch("user_movie_year")
    @user_movie.duration = params.fetch("user_movie_duration")
    @user_movie.description = params.fetch("user_movie_description")
    @user_movie.image = params.fetch("user_movie_image")
    @user_movie.director_id = params.fetch("user_movie_directorid")
    @user_movie.save

    redirect_to("/movies")
  end

  def mod_movie
    @m_id = params.fetch("path_id")
    @find_movie = Movie.where({ :id => @m_id })
    @movie_target = @find_movie.at(0)
    @movie_target.title = params.fetch("mod_movie_title")
    @movie_target.year = params.fetch("mod_movie_year")
    @movie_target.duration = params.fetch("mod_movie_duration")
    @movie_target.description = params.fetch("mod_movie_description")
    @movie_target.image = params.fetch("mod_movie_image")
    @movie_target.director_id = params.fetch("mod_movie_dID")
    @movie_target.save

    redirect_to("/movies/#{@m_id}")
  end

  def delete
    m_id = params.fetch("path_id")
    delete_target = Movie.where({:id => m_id})
    delete_movie = delete_target.at(0)
    delete_movie.destroy

    redirect_to("/movies")
  end

end
