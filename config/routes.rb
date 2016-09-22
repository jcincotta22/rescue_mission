Rails.application.routes.draw do
  root 'questions#index'
  resources :questions do
    resources :answers
  end
  get '/bestanswer/:id', to: 'answers#bestanswer', as: 'bestanswer'
  resources :answers
end
