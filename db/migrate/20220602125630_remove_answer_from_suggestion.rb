class RemoveAnswerFromSuggestion < ActiveRecord::Migration[7.0]
  def change
    remove_column :suggestions, :answer_id
  end
end
