class CreateLicenses < ActiveRecord::Migration
  def self.up
    create_table :licenses do |t|
      t.column :name, :string
      t.column :url, :string
      t.column :identifier, :string
    end
  end

  def self.down
    drop_table :licenses
  end
end
