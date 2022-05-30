class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :content
      t.references :answers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
