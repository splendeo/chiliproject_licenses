class LicenseVersion < ActiveRecord::Base
  unloadable

  belongs_to :license

  validates_presence_of :identifier
  validates_uniqueness_of :identifier, :scope => :license_id
  validates_format_of :identifier, :with => /^(?!\d+$)[a-z0-9\-_]*$/

  def to_param
    @to_param ||= identifier.to_s
  end

end
