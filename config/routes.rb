Rails.application.routes.draw do
  scope '(:locale)' do
    resources :transactions
    devise_for :users
  end

  get 'up' => 'rails/health#show', :as => :rails_health_check

  get ':locale', to: 'pages#home', as: :root_with_locale
  root 'pages#home'
end
