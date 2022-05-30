class CreateUserActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :user_activities do |t|
      t.references :activities, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
