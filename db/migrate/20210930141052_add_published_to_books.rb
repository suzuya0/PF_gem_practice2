class AddPublishedToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :published, :integer
  end
end
