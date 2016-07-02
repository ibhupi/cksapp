Rails.application.routes.draw do
  namespace :api, { format: :json } do
    resources :countries, only:[:index, :show]
    resources :locations, only:[:index, :show]
    resources :players, only:[:index, :show]
    resources :events, only:[:index, :show]
    resources :users, only:[:index, :show]
    resources :user_schedules, only:[:index, :show, :create, :destroy] do
      collection do
        put 'like/:id' => 'user_schedules#like'
      end
    end
  end
end
