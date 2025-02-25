Rails.application.routes.draw do
  
  #all GET requests
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  get("/delete_director/:path_id", {:controller => "directors", :action => "delete"})

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  get("/delete_movie/:path_id", {:controller => "movies", :action => "delete"})
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  get("/delete_actor/:path_id", {:controller => "actors", :action => "delete"})



#all POST requests

  post("/add_director", { :controller => "directors", :action => "new_director"})
  post("/modify_director/:path_id", {:controller => "directors", :action => "mod_director"})
  
  post("/add_movie", {:controller => "movies", :action => "add_movie"})
  post("/modify_movie/:path_id", {:controller => "movies", :action => "mod_movie"})

  post("/add_actor", {:controller => "actors", :action => "add_actor"})
  post("/modify_actor/:path_id", {:controller => "actors", :action => "mod_actor"})


end
