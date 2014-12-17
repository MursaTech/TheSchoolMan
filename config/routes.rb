Rails.application.routes.draw do
  resources :attendances

  resources :healths

  resources :disciplines

  resources :exam_results

  resources :exams

  resources :subject_allocations

  resources :subjects

  resources :streams

  resources :forms

  resources :students

  resources :guardians

  resources :accounts

  root to: 'visitors#index'
  devise_for :users
end
