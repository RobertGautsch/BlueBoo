class CreateTherapists < ActiveRecord::Migration[7.0]
  def change
    create_table :therapists do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.boolean :individual_therapy
      t.boolean :group_therapy
      t.boolean :available_places
      t.integer :waiting_time
      t.string :telephone_number

      t.timestamps
    end
  end
end
