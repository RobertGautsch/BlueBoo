class CreateTherapyTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :therapy_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
