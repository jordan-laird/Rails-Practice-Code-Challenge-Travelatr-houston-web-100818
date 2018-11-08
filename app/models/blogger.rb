class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def total_likes
        all_the_likes = 0
        self.posts.each do |post|
            all_the_likes += post.likes
        end
        all_the_likes
    end

    def featured_post
        if self.posts != []    
        self.posts.sort_by do |post|
            post.likes
        end
        self.posts.last
        end
    end

    def most_blogged_dests
        sorted_array = self.destinations.sort_by do |dest|
            dest.posts.length
        end
        sorted_array.pop(5)
    end

end
