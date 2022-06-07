class AddCoordinatesToTherapists < ActiveRecord::Migration[7.0]
  def change
    add_column :therapists, :latitude, :float
    add_column :therapists, :longitude, :float
  end
end
