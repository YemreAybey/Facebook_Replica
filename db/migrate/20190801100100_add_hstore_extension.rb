class AddHstoreExtension < ActiveRecord::Migration[5.2]
  def change
    def self.up
      enable_extension "hstore"
    end
    def self.down
      disable_extension "hstore"
    end
  end
end
