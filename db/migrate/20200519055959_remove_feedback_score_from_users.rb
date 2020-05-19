class RemoveFeedbackScoreFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :feedback_score, :integer
  end
end
