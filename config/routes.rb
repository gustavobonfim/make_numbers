Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  get '/about', to: 'about#about'

  match "/404", to: 'errors#not_found', via: :all
  match "/422", to: 'errors#unnacceptable', via: :all
  match "/500", to: 'errors#internal_error', via: :all

  namespace :make_numbers do
    get 'cnpj'
    get 'cpf'
  end
end
