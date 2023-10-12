class CreateCheckItemTags < ActiveRecord::Migration[7.0]
  def change
    create_table :check_item_tags do |t|
      t.integer :check_item_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
