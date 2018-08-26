Rails.application.routes.draw do
	devise_for :users
	resources :users
	resources :posts do 
		resources :comments
		member do 
			put 'like', to: "posts#like"
			put 'unlike', to: "posts#unlike"
		end
	end
	unauthenticated do 
		root to: 'welcome#index'
	end

	authenticated do 
		root to: 'posts#index'
	end
end
