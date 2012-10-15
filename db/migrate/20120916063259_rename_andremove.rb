class RenameAndremove < ActiveRecord::Migration
  change_table :users do |t|
   t.rename :user_name, :name
   t.remove :salt
 end 
end
