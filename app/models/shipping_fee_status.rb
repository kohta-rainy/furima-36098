class SpihipngFeeStatus < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :load

    validates :load_id, numericality: { other_than: 1 , message: "can't be blank"}
end
