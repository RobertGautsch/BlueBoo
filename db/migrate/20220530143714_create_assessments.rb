class CreateAssessments < ActiveRecord::Migration[7.0]
  def change
    create_table :assessments do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
