class LicenseVersion < ActiveRecord::Base
  unloadable

  belongs_to :license

  validates_presence_of :identifier
  validates_uniqueness_of :identifier, :scope => :license_id
  validates_format_of :identifier, :with => /^#{License::LICENSE_REGEX}$/

  def to_param
    @to_param ||= identifier.to_s
  end

end
