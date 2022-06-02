class AddAnswerTypeToSuggestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :suggestions, :question, foreign_key: true
    add_column :suggestions, :answer_type, :string
  end
end
