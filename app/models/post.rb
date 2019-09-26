class Post < ActiveRecord::Base


  validates :title, presence: true
  validate :check_title
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  def check_title
    if self.title
     if self.title.include? "Won't Believe" || "Secret" ||  "Top" || "Guess" || "True"

     else
       errors.add(:title)
     end
   end
  end

end
