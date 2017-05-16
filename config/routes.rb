Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'documents/:document_id/comments', to: 'comments#index'
  resources :documents, shallow: true do
    member do
      post :comments
    end

    resources :sections do
      collection do
        get :highlight
      end
    end
  end

  get 'sections/:section_id/comments', to: 'comments#index'
  resources :sections, only: [:index] do
    member do
      get :highlight
      post :comments
    end
    # get :highlight, on: :member
  end

  #get 'sections/', to: 'sections#index'
  get 'sections/:id/highlight', to: 'sections#highlight'

  resources :paragraphs
  #get 'documents/new', to: 'documents#new'
end
