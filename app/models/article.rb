class Article < ApplicationRecord
  belongs_to :user

  has_many :article_categories
  has_many :categories, through: :article_categories

  enum status: %i[inactive active archived]

  validates :title, presence: true, length: { minimum: 6, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }

  # validate :custom_validate_author

  # def custom_validate_author
  #   if user_id.nil? || author.blank?
  #     errors.add(:base, "User or Author must cannot be blank")
  #   end 
  # end
end
