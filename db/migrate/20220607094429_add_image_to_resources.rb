class AddImageToResources < ActiveRecord::Migration[7.0]
  def change
    add_column :resources, :image_url, :string
  end
end
