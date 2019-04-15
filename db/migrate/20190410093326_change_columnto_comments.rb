class ChangeColumntoComments < ActiveRecord::Migration[5.2]
  def up
    add_column :comments, :topic_id, :integer
  end

  def down
    remove_column :comments, :topic, :integer
  end
end
