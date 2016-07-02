Rails.application.routes.draw do
  namespace :api, { format: :json } do
    resources :countries, only:[:index, :show]
    resources :locations, only:[:index, :show]
    resources :players, only:[:index, :show]
    resources :events, only:[:index, :show]
    resources :users, only:[:index, :show]
    resources :user_schedules, only:[:index, :show, :create, :destroy]

    get 'googleplace' => 'googleplaceapi#hello'
  end
end
