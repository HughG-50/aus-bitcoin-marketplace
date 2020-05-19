class AddFeedbackScoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :feedback_score, :float
  end
end
