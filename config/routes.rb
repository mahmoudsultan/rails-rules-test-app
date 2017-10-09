Rails.application.routes.draw do
  resources :agencies do
    member do
      get 'features' => 'agencies#show_features'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
