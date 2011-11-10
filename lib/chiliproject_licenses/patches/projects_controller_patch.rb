module ChiliprojectLicenses
  module Patches
    module ProjectsControllerPatch

      def self.included(base) # :nodoc:
        base.class_eval do
          before_filter :get_licenses, :only => [:new, :create, :edit, :update, :settings]
        end
      end

      def get_licenses
        @licenses = LicenseVersion.all(:include => :license, :order => 'licenses.name ASC, license_versions.date DESC')
      end

    end
  end
end

