Rails.application.routes.draw do
  resources :stock_snapshots
  root "stock_snapshots#index"
end
