class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: %w(Fiction Non-Fiction)
  validate :clickbait

  def clickbait
    baity_phrases = ["Won't Believe", "Secret", "Guess", "Top"]
    if title.present? && baity_phrases.any?{ |phrase| self.title.include?(phrase)} == false
      errors.add(:clickbait, "not clickbait")
    end
  end

end
