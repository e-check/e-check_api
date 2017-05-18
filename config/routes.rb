Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :checkin
  resources :jinshuju_entries, only: :create
end
