Rails.application.routes.draw do

  get 'notes/new'
  get 'notes/show'
  get 'logs/index'
  get 'logs/create'
  devise_for :users

  resources :users, except:[:new,:edit] do
   resources :logs, only:[:create,:index]
end

  resources :notes, except:[:index,:edit] do
   resources :favorites, only:[:create,:destroy]
   resources :comments, only:[:create,:destroy]
   resources :work_notes, only:[:create,:destroy,:update]
end

  resources :team do
   resources :articles
   resources :chats, only:[:create,:destroy]
   resources :team_tags, only:[:create,:destroy]
   resources :user_team, only:[:create,:destroy,:index]
end

  resources :tags, only:[:create,:destroy,:index]
  resources :works, except:[:show,:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
