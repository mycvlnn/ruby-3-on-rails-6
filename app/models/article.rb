class Article < ApplicationRecord
  belongs_to :user, optional: true
  enum status: %i[inactive active archived]

  validates :title, presence: true, length: { minimum: 10, maximum: 50 }, if: :active?

  validate :custom_validate_author

  def custom_validate_author
    if user_id.nil? || author.blank?
      errors.add(:base, "User or Author must cannot be blank")
    end 
  end
end
