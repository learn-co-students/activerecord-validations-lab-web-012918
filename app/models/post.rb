class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :clickbaity

  def clickbaity
    if title && self.title.exclude?("Won't Believe") && self.title.exclude?("Secret") && title.exclude?("Top") && title.exclude?("Guess")
      errors.add(:title, "Not clickbaity enough")
    end
  end
end
