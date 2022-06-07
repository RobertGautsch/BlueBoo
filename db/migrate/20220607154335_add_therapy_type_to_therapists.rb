class AddTherapyTypeToTherapists < ActiveRecord::Migration[7.0]
  def change
    add_column :therapists, :therapy_type, :string
  end
end
