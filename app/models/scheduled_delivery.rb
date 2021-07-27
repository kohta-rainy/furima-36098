class ScheduledDelivery < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :day

    validates :day_id, numericality: { other_than: 1 , message: "can't be blank"}
end
