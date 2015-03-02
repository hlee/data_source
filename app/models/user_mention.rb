class UserMention < ActiveRecord::Base
  has_many :user_mention_mappings
  has_many :tweets, -> {uniq}, through: :user_mention_mappings
end
