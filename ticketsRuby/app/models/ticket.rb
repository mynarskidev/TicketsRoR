class PriceBelongsToRangeValidator < ActiveModel::Validator
  def validate(record)
    if record.price?
      if !((record.event.price_low <= record.price) && (record.event.price_high >= record.price))
        record.errors.add('The price', 'does not belong to the price range of the event')
      end
    end
  end
end

class Ticket < ApplicationRecord
  include ActiveModel::Validations
  validates_with PriceBelongsToRangeValidator

  validates :name, :presence => true, :length => { :minimum => 6 }
  validates :price, :presence => true, numericality: true
  validates :phone, :presence => true, :length => { :maximum => 12 }, numericality: true
  validates :seat_id_seq, :presence => true
  validates :email_address, :presence => true, format: { with: URI::MailTo::EMAIL_REGEXP }
  belongs_to :event
end
