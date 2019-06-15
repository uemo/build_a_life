Rails.application.routes.draw do

  get 'teams/home/:id' => 'teams#home'

  devise_for :users

  resources :users, except:[:new] do
   resources :logs, only:[:create,:index]
end

  resources :notes, except:[:index,:edit] do
   resources :favorites, only:[:create,:destroy]
   resources :comments, only:[:create,:destroy]
   # resources :work_notes, only:[:create,:destroy,:update]
end

  resources :teams do
   resources :articles
   resources :chats, only:[:create,:destroy]
   resources :tags, only:[:create,:destroy]
end

  resources :user_teams, only:[:create,:destroy,:index]
  resources :works, except:[:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
