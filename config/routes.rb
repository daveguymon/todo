Rails.application.routes.draw do
  devise_for :users
  root "todo_lists#index"
  resources :todo_lists do
    resources :todo_items do
      patch :complete
      patch :incomplete
    end
  end
end
