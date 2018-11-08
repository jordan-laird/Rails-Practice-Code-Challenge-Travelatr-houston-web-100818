class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger
    validates :title, presence: true
    validates :content, length: {minimum: 100}

    def like_button
        self.likes += 1
        self.save
    end
end
