class Article < ApplicationRecord
  enum status: %i[inactive active archived]
end
