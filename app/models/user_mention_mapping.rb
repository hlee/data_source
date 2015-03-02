class UserMentionMapping < ActiveRecord::Base
  belongs_to :user_mention
  belongs_to :tweet
end
