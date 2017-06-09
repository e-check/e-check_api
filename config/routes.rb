Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jinshuju_entries, only: [:index, :create, :destroy]
  get '/activities/:activity_id/attendances/:cellphone', to: 'activity_attendances#show', as: :activity_attendances
  get '/activities/:activity_id/people/:cellphone', to: 'activity_people#show', as: :activity_people
  resources :activities, only: %i[index show create destroy]
  resources :sessions, only: [:create]
  resources :attendances, only: %i[show index create]
end
