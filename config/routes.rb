Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  get '/error_page_controller', to: 'error_page_controller#pages'

  namespace :make_numbers do
    get 'cnpj'
    get 'cpf'
  end
end
