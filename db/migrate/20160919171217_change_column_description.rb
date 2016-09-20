class ChangeColumnDescription < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :desription
  end
end
