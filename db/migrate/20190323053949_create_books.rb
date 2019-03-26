class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :id
      t.string :title
      t.integer :user_id
      #t.string :category
      t.text :opinion

      t.timestamps
    end
  end
end

