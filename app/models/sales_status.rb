class SalesStatus < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :status

    validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
end
