class CreateLicenseVersions < ActiveRecord::Migration
  def self.up
    create_table :license_versions do |t|
      t.column :identifier, :string
      t.column :date, :date
      t.column :authors, :string
      t.column :text, :text
      t.column :url, :string
      t.column :license_id, :integer
    end
  end

  def self.down
    drop_table :license_versions
  end
end
