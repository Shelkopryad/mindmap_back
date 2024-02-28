class CreateTestCases < ActiveRecord::Migration[7.0]
  def change
    create_table :test_cases do |t|
      t.string :name
      t.string :category
      t.text :steps
      t.boolean :to_test
      t.timestamps
    end
  end
end
