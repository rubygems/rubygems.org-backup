class AddUrlToVersion < ActiveRecord::Migration
  def self.up
    add_column :versions, :url, :string
  end

  def self.down
    remove_column :versions, :url
  end
end
