class AddOption1ToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :option1, :string
    add_column :questions, :option2, :string
    add_column :questions, :option3, :string
  end
end
