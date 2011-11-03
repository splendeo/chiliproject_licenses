require_dependency 'projects_controller'

# Patches Chiliproject's Projects dynamically.  Adds a relationship
# Project +has_and_belongs_to_many+ to Licenses
module ChiliprojectLicenses
  module Patches
    module ProjectsControllerPatch
      def self.included(base) # :nodoc:
        base.extend(ClassMethods)

        # Same as typing in the class
        base.class_eval do
          before_filter :get_licenses, :only => [:new, :create, :edit, :update, :settings]
        end
      end

      def get_licenses
        @licenses = LicenseVersion.all(:include => :license, :order => 'licenses.name ASC, license_versions.date DESC')
      end

      module ClassMethods

      end

    end
  end
end

# Add module to Project
ProjectsController.send(:include, ChiliprojectLicenses::Patches::ProjectsControllerPatch)
