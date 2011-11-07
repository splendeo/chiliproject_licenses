ActionController::Routing::Routes.draw do |map|

  map.resources :licenses do |license|
    license.resources :license_versions,
                      :except => [:index, :show],
                      :as => 'version',
                      :requirements => {:id => License::LICENSE_REGEX }
  end

  map.license_version(
    'licenses/:license_id/:id',
    :controller => 'license_versions',
    :action => :show,
    :requirements => {:id => License::LICENSE_REGEX }
  )

end
