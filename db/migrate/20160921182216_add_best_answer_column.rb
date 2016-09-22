class AddBestAnswerColumn < ActiveRecord::Migration[5.0]
  def up
    add_column :answers, :best_answer, :boolean, default: false
  end

  def down
    remove_column :answers, :best_answer
  end
end
