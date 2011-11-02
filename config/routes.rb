ActionController::Routing::Routes.draw do |map|

  map.resources :licenses do |license|
    license.resources :license_versions, :except => [:index, :show]
  end

  map.license_version(
    'licenses/:license_id/:id',
    :controller => 'license_versions',
    :action => :show,
    :requirements => {:id => /\w[a-z0-9\.\-_]*/ }
  )

end
