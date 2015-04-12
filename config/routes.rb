Rails.application.routes.draw do
  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'users'   => 'users#index'
  get    'alltweets'  => 'static_pages#alltweets'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'hashtags/',         to: 'hashtags#index',     as: :hashtags
  get 'hashtags/:hashtag', to: 'hashtags#show',      as: :hashtag
    resources :users 


  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

end