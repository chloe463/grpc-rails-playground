class AddAuthorToEnquete < ActiveRecord::Migration[7.0]
  def change
    add_column :enquetes, :author_id, :integer
  end
end
