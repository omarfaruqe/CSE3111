Rails.application.routes.draw do
  resources :teachers_quarters
  resources :infos
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
