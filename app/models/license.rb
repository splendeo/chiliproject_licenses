class License < ActiveRecord::Base
  unloadable

  LICENSE_REGEX = /[a-zA-Z0-9][\w\-\.]*/


  has_many :license_versions, :dependent => :destroy

  validates_presence_of :name, :identifier
  validates_uniqueness_of :identifier
  validates_format_of :identifier, :with => /^#{LICENSE_REGEX}$/
  def to_param
    @to_param ||= identifier.to_s
  end


end
