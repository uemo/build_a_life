Rails.application.routes.draw do

  devise_for :users

  resources :users, except:[:new,:edit] do
   resources :logs, only:[:create,:index]
end

  resources :notes, except:[:index,:edit] do
   resources :favorites, only:[:create,:destroy]
   resources :comments, only:[:create,:destroy]
   resources :work_notes, only:[:create,:destroy,:update]
end

  resources :teams do
   resources :articles
   resources :chats, only:[:create,:destroy]
   resources :tags, only:[:create,:destroy]
   resources :user_teams, only:[:create,:destroy,:index]
end

  resources :works, except:[:show,:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
