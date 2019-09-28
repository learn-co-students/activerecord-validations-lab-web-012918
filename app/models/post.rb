class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length:{minimum: 250}
  validates :summary, length:{maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction) }
  validate :is_it_clickbait

  CLICKPATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_it_clickbait
    CLICKPATTERNS.each do |pattern|
      if self.title && !self.title.match(pattern)
        return errors.add(:title, "must be clickbait with")
      else
        return
      end
    end

  end


end
