Rails.application.routes.draw do

devise_for :users,
    controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: 'users/registrations'}

devise_scope :user do
  get 'register', to: 'devise/registrations#new', as: :register
  get 'login', to: 'devise/sessions#new', as: :login
  get 'logout', to: 'devise/sessions#destroy', as: :logout
end

  get 'show_privates', to: 'negotiations#show_privates'
  get 'negotiations', to: 'negotiations#create'
  get 'search/contracts', to: 'search#searching_for_contracts'
  get 'search/developers', to: 'search#searching_for_developers'
  get 'my_contracts', to: 'contracts#my_contracts'
  match '/my_contracts/:id/edit', to: 'contracts#my_contracts_edit', as: :my_contracts_edit, :via => [:get,:post]
  get 'employer_favorites/destroy', to: 'employer_favorites#destroy'

  resources :developers do
    get :new_profile_conversion, on: :collection 
  end
  resources :employers
  resources :contracts do
    post :check_developer_minimum, on: :collection
    get :update_contract_status_as_closed_and_pay_developer, on: :member
    get :developer_requests_contract_marked_complete, on: :member
    get :download_pdf, on: :member 
    get :new_contract_conversion, on: :collection
    get :developer_rejects_contract_offer, on: :member
  end
  resources :payments
  resources :negotiations do
    post :send_email_to_developer, on: :member
    post :send_email_to_employer, on: :member  
    get :download_pdf, on: :member       
  end
  resources :ratings
  resources :employer_favorites
  resources :employer_blocks
  resources :developer_favorites
  resources :payment_notifications

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

get '/:id', to: 'developers#show'
get '/:id', to: 'employers#show'

match ':controller(/:action(/:id(.:format)))', 
  :via => [:get,:post]

  root to: "landing_page#index"
end


