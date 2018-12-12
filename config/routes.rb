Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :applicant

  get '/compare', to: 'applicant#compare'
  put '/compare', to: 'applicant#compare' 
end
