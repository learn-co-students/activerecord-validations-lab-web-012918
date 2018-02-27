class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :exciting_title

  def exciting_title
    if title != nil
      if %w(Won't/ Believe Secret Top Guess).any? { |s| title.include? s }
      else
        errors.add(:title, "Not Exciting Enough")
      end
    end
  end
end
