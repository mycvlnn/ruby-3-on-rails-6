class Article < ApplicationRecord
  belongs_to :user
  enum status: %i[inactive active archived]
end
