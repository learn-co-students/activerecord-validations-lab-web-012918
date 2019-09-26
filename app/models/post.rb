require 'byebug'


class Post < ActiveRecord::Base
  # include ActiveModel::Validations

  # validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_baity

  def click_baity
    good_words = ["Won't Believe", "Secret", "Top", "Guess"]
    # byebug
    good_words.each do |word|
      if self.title == nil
        errors.add(:title, "nil")
      elsif self.title.include?(word)
         return true
       else
         errors.add(:title, "Need better word")
      end
    end
  end

end

# class MyValidator < ActiveModel::Validator
#   def validate(post)
#     good_words = ["Won't Believe", "Secret", "Top", "Guess"]
#       words = post.title.split
#       words.each do |word|
#         unless good_words.include?(word)
#           return false
#         end
#       end
#       true
#   end
# end
