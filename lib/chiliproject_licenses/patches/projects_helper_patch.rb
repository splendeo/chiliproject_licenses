require_dependency 'projects_helper'

module ChiliprojectLicenses
  module Patches
    module ProjectsHelperPatch
      def self.included(base)
        base.class_eval do
          unloadable

          def link_to_license(license_version)
            link_to(license_version.title, license_url(license_version))
          end

          def license_url(license_version)
            return license.version.url if license_version.url.present?
            license_version_path(license_version.license, license_version)
          end
        end
      end
    end
  end
end
