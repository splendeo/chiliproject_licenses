class License < ActiveRecord::Base
  unloadable

  LICENSE_REGEX = /[a-zA-Z0-9][\w\-\.]*/

  has_many :versions, :class_name => 'LicenseVersion', :dependent => :destroy, :order => 'license_versions.date DESC'

  validates_presence_of :name, :identifier
  validates_uniqueness_of :identifier
  validates_format_of :identifier, :with => /^#{LICENSE_REGEX}$/

  accepts_nested_attributes_for :versions, :allow_destroy => false


  def to_param
    @to_param ||= identifier.to_s
  end

  def latest_version
    versions.first
  end

  def first_version_attributes=(params)
    versions.build(params)
  end

end
