class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 300 }
  validates :summary, length: { maximum: 20 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} must be Fiction or Non-Fiction" }


  validate :non_clickbait
  def non_clickbait
    clickbait = ["won't believe", "secret", "top [number]", "guess"]
    clickbait.each do |phrase|
      # binding.pry
      if self.title == nil
        errors.add(:title, "nil")
      elsif self.title.downcase.include?(phrase)
        break
      else
        errors.add(:title, "Not click-baity enough.")
      end
    end
  end
end
