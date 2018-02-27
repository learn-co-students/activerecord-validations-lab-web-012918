class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if self.title.present? && !["Won't Believe", "Secret", "Top /[0-9]+/", "Guess"].any? { |word| self.title.include?(word) }
      errors.add(:title, "must be clickbait")
    end
  end
  
end
