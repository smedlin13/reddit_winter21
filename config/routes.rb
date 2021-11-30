Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#Route is going to be the http request and do crud actions in the browser
#lead somewhere in the controller
#combo url + http request
# root 'static#home' 
# #root 'controller#action' - home page to the url pattern
#resources :controller - generates all the routes and actions for a controller
#best practice
# resources :contacts do
#   resources :notes
# end

# resources :notes do
#   resources :comments
# end
#custom routes - doing the routes by hand
#httpverb 'pattern', to: 'controller#action'
# get         Read
# post        create
# put / patch   update
# delete      destroy
# get '/taco'

root 'subs#index'

  resources :subs do
    resources :topics
  end

  # bad
  # resources :subs do
  #   resources :topics do
  #     resources :comments
  #   end
  # end
  resources :topics, except: [:index, :new, :create, :show, :update, :destroy] do
    resources :comments
  end
# end

end
