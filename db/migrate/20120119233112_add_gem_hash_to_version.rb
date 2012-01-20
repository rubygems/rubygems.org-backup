class AddGemHashToVersion < ActiveRecord::Migration
  def self.up
    add_column :versions, :gem_hash, :string
  end

  def self.down
    remove_column :versions, :gem_hash
  end
end
