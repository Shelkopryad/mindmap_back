class CreateCheckItems < ActiveRecord::Migration[7.0]
  def change
    create_table :check_items do |t|
      t.string :item_to_check
      t.boolean :to_test
      t.timestamps
    end
  end
end
