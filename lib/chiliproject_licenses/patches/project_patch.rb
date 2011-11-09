require_dependency 'project'

# Patches Chiliproject's Projects dynamically.  Adds a relationship
# Project +has_and_belongs_to_many+ to Licenses
module ChiliprojectLicenses
  module Patches
    module ProjectPatch
      def self.included(base) # :nodoc:
        base.class_eval do
          unloadable # Send unloadable so it will not be unloaded in development

          belongs_to :license, :class_name => 'LicenseVersion'

          safe_attributes :license_id
        end
      end
    end
  end
end
