# encoding: utf-8
require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare :chiliproject_licenses do
  require_dependency 'project'
  require_dependency 'chiliproject_licenses/patches/project_patch'
  Project.send(:include, ChiliprojectLicenses::Patches::ProjectPatch)

  require_dependency 'projects_controller'
  require_dependency 'chiliproject_licenses/patches/projects_controller_patch'
  ProjectsController.send(:include, ChiliprojectLicenses::Patches::ProjectsControllerPatch)

  require_dependency 'projects_helper'
  require_dependency 'chiliproject_licenses/patches/projects_helper_patch'
  ProjectsHelper.send(:include, ChiliprojectLicenses::Patches::ProjectsHelperPatch)

  require_dependency 'chiliproject_licenses/hooks'
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

  menu :top_menu, :licenses, { :controller => 'licenses', :action => 'index' }, :caption => I18n.t(:label_license_plural, :default => "Licenses"), :after => :projects

  permission :view_licenses, :licenses => [:show, :index]
end
