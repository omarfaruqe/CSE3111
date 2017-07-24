Rails.application.routes.draw do
  put "/admins", to: "admins#update"
  patch "/admins", to: "admins#update"
  resources :courses
  resources :infos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
