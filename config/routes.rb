Rails.application.routes.draw do
  root 'subs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # HTTP Protocals
  #get
  #post
  #put
  #delete
  # get '/subs', to: 'subs#index'

  resources :subs do
    resources :topics
  end
end
