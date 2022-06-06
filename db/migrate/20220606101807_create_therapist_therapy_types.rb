class CreateTherapistTherapyTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :therapist_therapy_types do |t|
      t.references :therapist, null: false, foreign_key: true
      t.references :therapy_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
