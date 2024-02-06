class CreateJoinTableTestCasesTags < ActiveRecord::Migration[7.0]
  def change
    create_join_table :test_cases, :test_case_tags do |t|
      t.index [:test_case_id, :test_case_tag_id]
      t.index [:test_case_tag_id, :test_case_id]
    end
  end
end
