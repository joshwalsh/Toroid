Toroid::Application.routes.draw do
  root :to => 'games#show'
  post 'game/run', :to => 'games#advance', :as => :run_game

  resources :planets, only: [:show, :index] do
    resources :organisms, only: [:index]
  end
end
