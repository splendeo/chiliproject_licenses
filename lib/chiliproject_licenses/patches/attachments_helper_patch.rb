require_dependency 'attachments_helper'

module ChiliprojectLicenses
  module Patches
    module AttachmentsHelperPatch
      def self.included(base)
        base.class_eval do
          unloadable
        end
      end
    end
  end
end

AttachmentsHelper.send(:include, ChiliprojectLicenses::Patches::AttachmentsHelperPatch)
