Toroid::Application.routes.draw do
  root :to => 'games#show'
  put 'game/run', :to => 'games#advance', :as => :run_game
  get 'game/logs', :to => 'logs#game', :as => :game_logs

  resources :planets, only: [:show, :index] do
    resources :organisms, only: [:index]
  end
end
