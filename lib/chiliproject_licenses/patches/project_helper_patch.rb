require_dependency 'project'

# Patches Chiliproject's Projects dynamically.  Adds a relationship
# Project +has_and_belongs_to_many+ to Licenses
module ChiliprojectsLicenses
  module Patches
    module ProjectPatch
      def self.included(base) # :nodoc:
        base.extend(ClassMethods)

        # Same as typing in the class
        base.class_eval do
          unloadable # Send unloadable so it will not be unloaded in development

          safe_attributes 'license_id'



          belongs_to :license, :class_name => 'LicenseVersion'
        end
      end

      module ClassMethods

      end

    end
  end
end

# Add module to Project
Project.send(:include, ChiliprojectsLicenses::Patches::ProjectPatch)
