Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :checkin
  resources :jinshuju_entries, only: [:index, :create, :destroy]
  get '/forms/:form_id/entries/:cellphone', to: 'form_entries#show', as: :form_entries
  resources :activities, only: [:index, :create, :destroy]
end
