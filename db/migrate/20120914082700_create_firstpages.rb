class CreateFirstpages < ActiveRecord::Migration
  def change
    create_table :firstpages do |t|
      t.string :title
      t.string :date
      t.string :pid
      t.text :content
      t.string :user
      t.string :author

      t.timestamps
    end
  end
end
