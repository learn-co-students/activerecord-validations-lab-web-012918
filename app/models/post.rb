class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if title?
      unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any?{|el| title.include?(el)}
        errors.add(:title, "Need more clickbait")
      end
    end
  end


end
