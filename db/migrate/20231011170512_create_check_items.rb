class CreateCheckItems < ActiveRecord::Migration[7.0]
  def change
    create_table :check_items do |t|
      t.string :case_name
      t.text :test_case
      t.boolean :to_test
      t.timestamps
    end
  end
end
