Rails.application.routes.draw do
  resources :tasks do

  end

  resources :boards do
    resources :lists do

    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
