class CreateTestCaseTags < ActiveRecord::Migration[7.0]
  def change
    create_table :test_case_tags do |t|
      t.string :tag
      t.timestamps
    end
  end
end
