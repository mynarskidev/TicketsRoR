class PastDateValidator < ActiveModel::Validator
  def validate(record)
    if record.event_date < Date.today
      record.errors.add('Event', 'from past cannot be added')
    end
  end
end

class PriceRangeValidator < ActiveModel::Validator
  def validate(record)
    if record.price_low > record.price_high
      record.errors.add('Maximum price', 'cannot be higher then lowest price')
    end
  end
end

class Event < ApplicationRecord
  include ActiveModel::Validations
  validates_with PastDateValidator
  validates_with PriceRangeValidator

  validates :artist, :presence => true
  validates :price_low, :presence => true, numericality: true
  validates :price_high, :presence => true, numericality: true
  validates :event_date, :presence => true
  # has_many :tickets TODO console.log
end