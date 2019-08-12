# frozen_string_literal: true

class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'hstore'
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :hstore
    add_column :users, :bio, :string
  end
end
