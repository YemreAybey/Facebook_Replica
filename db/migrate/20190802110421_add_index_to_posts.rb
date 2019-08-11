# frozen_string_literal: true

class AddIndexToPosts < ActiveRecord::Migration[5.2]
  def change
    add_index :posts, :body
  end
end
