class RenameCaptionColumnToBooks < ActiveRecord::Migration[6.1]
  
  def change
    rename_column :books, :caption, :opinion
  end
end
