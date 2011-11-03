require_dependency 'projects_helper'

# Patches Chiliproject's Projects dynamically.  Adds a relationship
# Project +has_and_belongs_to_many+ to Licenses
module ChiliprojectLicenses
  module Patches
    module ProjectsHelperPatch
      def self.included(base) # :nodoc:
        base.class_eval do
          unloadable # Send unloadable so it will not be unloaded in development
          def link_to_license(license_version)
            link_to(license_version.title, license_url(license_version))
          end

          def license_url(license_version)
            return license.version.url if license_version.url.present?
            license_version_path(license_version)
          end
        end
      end
    end
  end
end

# Add module to Project
ProjectsHelper.send(:include, ChiliprojectLicenses::Patches::ProjectsHelperPatch)
