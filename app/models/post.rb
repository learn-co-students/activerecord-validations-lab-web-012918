class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :non_clickbait


  def non_clickbait
    if self.title
       if self.title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
       else
         errors.add(:title, "Must include \"Won't Believe\", \"Secret\", \"Top
  [number]\", or \"Guess\"")
       end
     else
       errors.add(:title, "Invalid Title")
     end
   end
end
