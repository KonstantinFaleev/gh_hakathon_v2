Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sites#index'
  get 'sites/:site_id' => 'sites#show'
  get '/refresh' => 'sites#refresh'
end
