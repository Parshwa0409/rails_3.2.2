Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  root to:"home#index"
  # get "/", to:"main#index"

  get "/home", to:"home#index"
  get "/about", to:"about#index"

  # alias to the actual page
  get "/contact-us", to:"contact#index", as:  :contact # === # get "/contact", to:"contact#index"

end
