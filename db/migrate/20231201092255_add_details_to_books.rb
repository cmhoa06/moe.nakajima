class AddDetailsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :image, :string
    add_column :books, :author, :string
    add_column :books, :introduction, :text
  end
end
