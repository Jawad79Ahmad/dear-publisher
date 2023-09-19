Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    registrations: 'users/registrations', passwords: 'users/passwords'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'client/dashboard#index'
  get :forms, to: 'components#forms'
  get :cards, to: 'components#cards'
  get :charts, to: 'components#charts'
  get :buttons, to: 'components#buttons'
  get :modals, to: 'components#modals'
  get :tables, to: 'components#tables'
  scope 'pages' do
    get :login, to: 'pages#login'
    get :create_account, to: 'pages#create_account'
    get :forgot_password, to: 'pages#forgot_password'
    get '404', to: 'pages#unavailable', as: :unavailable
  end
end
