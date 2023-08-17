class RenameItroductionColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :itroduction, :introduction
  end
end
