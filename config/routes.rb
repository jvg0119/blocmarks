Rails.application.routes.draw do

	#post :incoming, to: 'incoming#create'

  resources :topics do 
  	resources :bookmarks, except: [:index]
  end

  resources :users, only: [:update]
  devise_for :users
  

  get 'index' => 'welcome#index'
  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
