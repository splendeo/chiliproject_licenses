# encoding: utf-8
require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare :chiliproject_licenses do
#  require_dependency 'chiliproject_licenses/patches/project_patch'
#  require_dependency 'chiliproject_licenses/hooks'
end

Redmine::Plugin.register :chiliproject_licenses do
  name 'Chiliproject licenses plugin'
  author 'Francisco de Juan, Enrique García Cota'
  description 'Adds Licenses support to Chiliproject'
  version '0.1.0'
  url 'https://github.com/splendeo/chiliproject_licenses'
  author_url 'http://www.splendeo.es'

  settings  :partial => 'settings/licenses',
            :default => {
              'top_text' => '',
              'bottom_text' => ''
            }

  menu :top_menu, :licenses, { :controller => 'licenses', :action => 'index' }, :caption => I18n.t('licenses'), :after => :projects

  permission :view_licenses, :licenses => [:show, :index]
end
