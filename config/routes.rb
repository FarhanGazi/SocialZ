Rails.application.routes.draw do

	devise_for :users

	resources :users

	resources :posts do 
		resources :comments
	end

	unauthenticated do 
		root to: 'posts#index'
	end

	authenticated do 
		root to: 'posts#index'
	end
	
end
