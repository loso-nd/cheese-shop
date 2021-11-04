Rails.application.routes.draw do
  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  # get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
  # get 'cheeses', to: 'cheeses#index' 

   resources :cheeses, only: [:index, :show, :create]
   resources :sneakers

   #custom route calculating the number of likes and incrementing it
   patch "sneakers/:id/likes", to: "sneaker#increment_likes"
end
