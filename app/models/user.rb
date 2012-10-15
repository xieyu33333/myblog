class User < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :name
  validates_presence_of :name
  validates_uniqueness_of :name
 
  has_secure_password  
  

end
