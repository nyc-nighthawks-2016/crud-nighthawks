class CreateNighthawks < ActiveRecord::Migration
  def change
    create_table :nighthawks do |t|
      t.string :name, null: false
      t.string :home, null: false

      t.timestamps null: false
    end
  end
end
