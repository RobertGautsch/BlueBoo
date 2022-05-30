class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :text
      t.string :topic
      t.string :reading_duration

      t.timestamps
    end
  end
end
