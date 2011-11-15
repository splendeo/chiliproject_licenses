module ChiliprojectLicenses
  module Patches
    module ProjectsControllerPatch

      def self.included(base) # :nodoc:
        base.class_eval do
          helper :license_versions
          include LicenseVersionsHelper

          before_filter :get_licenses, :only => [:new, :create, :edit, :update, :settings]
        end
      end

      def get_licenses
        @licenses = LicenseVersion.for_select
      end

    end
  end
end

