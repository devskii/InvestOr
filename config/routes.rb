Rails.application.routes.draw do
  root "stock_snapshots#index"
  get "/addsnapshot", to: "stock_snapshots#index"
end
