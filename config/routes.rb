Rails.application.routes.draw do

  resources :bookmarks, only: [] do
  #resources :bookmarks do 
    resources :likes, only: [:index, :create, :destroy]
  end

  post :incoming, to: 'incoming#create'

  resources :topics do 
  	resources :bookmarks, except: [:index]
  end

  devise_for :users
  resources :users, only: [:update, :show]

  get 'index' => 'welcome#index'
  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
