class Ticket < ApplicationRecord
  validates :name, :presence => true, :length => { :minimum => 6 }
  validates :price, :presence => true
  validates :phone, :presence => true, :length => { :maximum => 12 }
  validates :seat_id_seq, :presence => true
  validates :email_address, :presence => true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
