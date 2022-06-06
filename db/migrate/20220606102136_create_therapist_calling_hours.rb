class CreateTherapistCallingHours < ActiveRecord::Migration[7.0]
  def change
    create_table :therapist_calling_hours do |t|
      t.string :weekday
      t.string :start_time
      t.string :end_time
      t.references :therapist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
