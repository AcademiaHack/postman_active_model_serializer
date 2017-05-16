Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  shallow do
    resources :documents do
      resources :comments
      resources :sections do
        resources :comments, except: [:edit, :show, :update, :destroy]
        resources :paragraphs do
          collection do
            get :highlight
          end
          resources :comments, except: [:edit, :show, :update, :destroy]
        end
      end
    end
  end

  resources :sections, only: [:index, :show] do
    member do
      get :highlight
    end
  end
  resources :comments, only: [:index, :show]


  # resources :comments, only: [:edit, :update, :show, :destroy] do
  #   member do
  #     get :highlight
  #   end
  # end

  # resources :documents, shallow: true do
  #   resources :comments, only: [:index, :create]

  #   resources :sections do
  #     resources :comments, only: [:index, :create]
  #     collection do
  #       get :highlight
  #     end
  #   end
  # end


  # resources :sections, only: :index, shallow: true do
  #   member do
  #     get :highlight
  #   end
  #   resources :paragraphs
  # end

  # resources :paragraphs, only: [] do
  #   resources :comments, only: [:index, :create]
  # end
  # shallowless
  # resources :documents do
  #   resources :sections, only: [:index, :create, :new]
  # end
  # resources :sections, only: [:edit, :update, :show, :destroy]
end
