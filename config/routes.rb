Rails.application.routes.draw do
  get 'pages/settings'

  get 'pages/dashboard'
  # get 'pages/timetable'

  resources :attendances

  resources :healths

  resources :disciplines

  resources :exam_results

  resources :exams

  resources :subject_allocations

  resources :subjects

  resources :streams

  resources :forms

  get "/students/upload" => "students#upload_page", as: "students_upload_page"

  resources :students

  resources :guardians

  resources :accounts

  root to: 'home#index'
  devise_for :users
  post "/users/add_user" => "users#create", :as => "add_user"
  resources :users

  post "/students/delete_multiple" => "students#delete_multiple", as: "delete_multiple_students"
  post "/subjects/delete_multiple" => "subjects#delete_multiple", as: "delete_multiple_subjects"

  post "/streams/delete_multiple" => "streams#delete_multiple", as: "delete_multiple_streams"
  post "/streams/assign" => "streams#assign", as: "class_assign"
  post "/streams/add_to_class" => "streams#add_to_class", :as => "add_stream_to_class", via: [:post]

  post "/upload_students" => "students#bulk_upload", :as => "upload_students", via: [:post]
  
  post "/add_to_class" => "students#add_to_class", :as => "add_to_class", via: [:post]

  post "/forms_and_streams" => "students#forms_and_streams", :as => "forms_and_streams", via: [:post]

  get "/timetable" => "pages#timetable", as: "timetable"
end
