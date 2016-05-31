Rails.application.routes.draw do
  namespace :api,
            constraints: { subdomain: 'api' },
            path: '/',
            defaults: { format: 'json' } do
    get 'populate', to: 'homes#populate'
    get 'populate/:id', to: 'homes#show'
    put 'populate/:id', to: 'homes#ilike'
    get 'status', to: 'heartbeat#status'
    root to: 'homes#hundred'
    match '*path', via: :all, to: 'application#render_not_found'
  end

  get 'populate', to: 'homes#populate'
  put 'populate/:id', to: 'homes#ilike'
  root to: 'homes#hundred'
end
