class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  # validates :check_title
  #
  # BAIT = [
  #   /Won't Believe/i,
  #   /Secret/i,
  #   /Top [0-9]*/i,
  #   /Guess/i
  # ]
  #
  # def check_title
  #   if BAIT.none? {|pattern| pattern.match title}
  #     errors.add(:title, "must be clickbait")
  #   end
  # end
end
