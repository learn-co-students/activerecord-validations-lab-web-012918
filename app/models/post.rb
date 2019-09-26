class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbaity?


  @@phrases = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
  def is_clickbaity?
    # binding.pry
    t = self.title
    # Enumerable#none? passes each regex to the block
    # Regexp#match is called against the title for each rege in the @@phrases array
    if @@phrases.none? {|ph| ph.match(t)}
      # if errors.messages collection is empty, then self.valid? == true (?)
      errors[:name] << "Title must be clickaity"
      errors.messages.empty? # not necessary?
    end
  end



end
