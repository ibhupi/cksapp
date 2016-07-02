Rails.application.routes.draw do
  constraints subdomain: 'api', format: :json do
    resources :countries
    resources :locations
    resources :players
    resources :events
  end
end
