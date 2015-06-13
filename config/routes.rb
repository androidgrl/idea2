Rails.application.routes.draw do
  root 'application#index'

  get "/sign_up" => "registrations#new"
  post "/sign_up" => "registrations#create"
end
