class AddLicenseIdToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :license_id, :integer
  end

  def self.down
    remove_column :projects, :license_id
  end
end
