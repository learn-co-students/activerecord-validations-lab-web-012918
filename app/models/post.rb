class Post < ActiveRecord::Base
  validates(:title, {presence: true})
  validates(:content, length:{minimum: 250})
  validates(:summary, length:{maximum: 250})
  validates(:category, inclusion: {in: %w(Fiction Non-Fiction)})
  validate :title_not_clickbaity

  def title_not_clickbaity
    if title
      if !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top[number]") && !title.include?("Guess")
        errors.add(:title, "#{title} is not clickbaity")
      end
    end 
  end

end
