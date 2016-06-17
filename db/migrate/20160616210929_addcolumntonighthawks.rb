class Addcolumntonighthawks < ActiveRecord::Migration
  def change
    add_column :nighthawks, :user_id, :integer
  end
end
