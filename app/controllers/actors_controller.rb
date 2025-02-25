class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def add_actor
      @user_actor= Actor.new
      @user_actor.name = params.fetch("user_actor_name")
      @user_actor.dob = params.fetch("user_actor_dob")
      @user_actor.bio = params.fetch("user_actor_bio")
      @user_actor.image = params.fetch("user_actor_image")
      @user_actor.save
  
      redirect_to("/actors")
  end

  def mod_actor
    @a_id = params.fetch("path_id")
    @find_actor = Actor.where({ :id => @a_id })
    @actor_target = @find_actor.at(0)
    @actor_target.name = params.fetch("mod_actor_name")
    @actor_target.dob = params.fetch("mod_actor_dob")
    @actor_target.bio = params.fetch("mod_actor_bio")
    @actor_target.image = params.fetch("mod_actor_image")
    @actor_target.save

    redirect_to("/actors/#{@a_id}")
  end

  def delete
    a_id = params.fetch("path_id")
    delete_target = Actor.where({:id => a_id})
    delete_actor = delete_target.at(0)
    delete_actor.destroy

    redirect_to("/actors")
  end

end
