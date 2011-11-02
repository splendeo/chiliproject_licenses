class License < ActiveRecord::Base
  unloadable

  has_many :license_versions, :dependent => :destroy

  validates_presence_of :name, :identifier
  validates_uniqueness_of :identifier
  validates_format_of :identifier, :with => /^(?!\d+$)[a-z0-9\-_]*$/

  def to_param
    @to_param ||= identifier.to_s
  end


end
