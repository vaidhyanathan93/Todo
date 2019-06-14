Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope 'api',  defaults: {format: 'json'}, as: 'api' do
    resources :task, id: /\d+/ do
      member do
        post :complete
        post :incomplete
      end
    end

  end
end
