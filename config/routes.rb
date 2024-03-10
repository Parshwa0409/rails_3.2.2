Rails.application.routes.draw do
  
  
  
  get "up" => "rails/health#show", as: :rails_health_check
  
  root to:"home#index"
  # get "/", to:"main#index"

  get "/home", to:"home#index"
  get "/service", to:"service#index"
  

  # alias to the actual page
  get "/contact-us", to:"contact#index", as:  :contact # === # get "/contact", to:"contact#index"
  get "/about-us", to:"about#index", as:  :about # === # get "/about", to:"about#index"

  # route to the page where the new user will register
  get 'sign_up', to: 'registration#new'

  # route to sign-in the user
  get 'sign_in', to:'sign_in#index'
  post 'sign_in', to:'sign_in#check'

  # log_out
  get 'logout', to:'home#log_out'


  # if we post to create, we might get the data in create() of registrations controller
  post 'sign_up', to: 'registration#create'

end
