class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def new_director
    @user_director= Director.new
    @user_director.name = params.fetch("user_director_name")
    @user_director.dob = params.fetch("user_director_dob")
    @user_director.bio = params.fetch("user_director_bio")
    @user_director.image = params.fetch("user_director_image")
    @user_director.save

    redirect_to("/directors")
  end

  def mod_director
    @d_id = params.fetch("path_id")
    @find_director = Director.where({ :id => @d_id })
    @director_target = @find_director.at(0)
    @director_target.name = params.fetch("mod_director_name")
    @director_target.dob = params.fetch("mod_director_dob")
    @director_target.bio = params.fetch("mod_director_bio")
    @director_target.image = params.fetch("mod_director_image")
    @director_target.save

    redirect_to("/directors/#{@d_id}")
  end

  def delete
    d_id = params.fetch("path_id")
    delete_target = Director.where({:id => d_id})
    delete_director = delete_target.at(0)
    delete_director.destroy

    redirect_to("/directors")
  end

end
