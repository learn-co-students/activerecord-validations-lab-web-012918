class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 50}
  validates :summary, length: {maximum: 50}
  validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
  validate :clickbait

  def clickbait
    if self.title == nil
      errors.add(:title)
    elsif self.title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      true
    else
      errors.add(:title)
    end
  end
end
