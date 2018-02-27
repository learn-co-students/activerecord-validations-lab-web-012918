class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :check_title
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  def check_title
      # ok_titles = ["Won't Believe", "Secret", "True", "Top", "Guess"]
    if self.title
      if self.title.include? "Won't Believe" || "Secret" || "True" || "Top" || "Guess"
      else
        errors.add(:title)
      end
    end
  end
end
