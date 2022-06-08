class AddIconsToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :icon_path, :string
  end
end
