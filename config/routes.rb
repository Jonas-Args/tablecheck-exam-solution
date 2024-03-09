Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'weather', to: 'weather#show'
    end
  end
end
