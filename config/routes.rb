Rails.application.routes.draw do
  resources :projects
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:  'pages#home'
  resources :tasks,  except:  [:index]
end
