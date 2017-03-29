Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "links#index"
  resources :links do 
	  member do 
		  put "like", to: "links#upvote"
		  put "dislike", to: "links#downvote"
      put "comments", to: "link#comments"
	  end 
    resources :comments
  end 

  resources :comments

  
end
