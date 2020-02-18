class Destroy < ActiveRecord::Migration[5.2]
  def up
    drop_table :comments
  end
end
