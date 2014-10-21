class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      # t.integer :image_id
      t.boolean :rescued, default:false
    end
  end
end
