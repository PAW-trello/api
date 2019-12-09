Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post 'lists/:id/swap', to: 'lists#swap'
  resources :tasks do end

  resources :lists do
    resources :cards do
    end
  end

  resources :cards do
    resources :comments do
    end
  end

  resources :boards do
    resources :lists do
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
