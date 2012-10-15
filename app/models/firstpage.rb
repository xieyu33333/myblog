class Firstpage < ActiveRecord::Base
  attr_accessible :author, :content, :date, :pid, :title, :user
  validates :pid, :presence => true
  validates :content, :presence => true
  validates :title, :presence => true
                   
                       
end
