Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :checkin
  resources :jinshuju_entries, only: [:index, :create, :destroy]
  get '/forms/:form_id/entries/:cellphone', to: 'checkin#check_signup', as: :check_signup
  resources :activities, only: [:index, :create]
end
