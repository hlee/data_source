class Hashtag < ActiveRecord::Base
  has_many :hashtag_mappings
  has_many :tweets, -> {uniq}, through: :hashtag_mappings
end
