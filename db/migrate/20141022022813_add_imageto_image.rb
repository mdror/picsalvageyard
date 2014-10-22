class AddImagetoImage < ActiveRecord::Migration
  def change

    add_column :images, :image, :string

  end
end
