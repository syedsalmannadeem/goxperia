Rails.application.routes.draw do
  root to:"welcome#index"
  # devise_for :admin_users
  devise_for :admin_users, path: '', path_names: { sign_in: 'admin/login', sign_out: 'admin/logout'}
  resources :locations
  get '/admin/locations/upload_spreadsheet', to: 'admin/locations#upload_spreadsheet'
  post '/admin/locations/parse_spreadsheet', to: 'admin/locations#parse_spreadsheet'
  namespace :admin do
    resources :locations
  end
  get '/admin', to: 'admin/locations#index'
  get "/:page" => "static#show"
end
