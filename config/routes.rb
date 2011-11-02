ActionController::Routing::Routes.draw do |map|

  map.resources :licenses do |license|

    license.resources :versions, :except => [:index, :show]
  end

  map.license_version(
    'licenses/:license_id/:id',
    :controller => 'license_versions',
    :action => :show,
    :requirements => {:id => /\w[a-z0-9\.\-_]*/ }
  )

=begin
  map.new_license_version     'licenses/:license_id/new',     :controller => 'license_versions', :action => :new
  map.edit_license_version    'licenses/:license_id/edit',    :controller => 'license_versions', :action => :edit
  map.update_license_version  'licenses/:license_id/update',  :controller => 'license_versions', :action => :update, :method => :put
  map.create_license_version  'licenses/:license_id/create',  :controller => 'license_versions', :action => :create, :method => :post
  map.destroy_license_version 'licenses/:license_id/destroy', :controller => 'license_versions', :action => :destroy, :method => :delete
=end

end
