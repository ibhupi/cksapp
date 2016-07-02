Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    resources :countries
    resources :locations
    resources :players
    resources :events
  end
end
