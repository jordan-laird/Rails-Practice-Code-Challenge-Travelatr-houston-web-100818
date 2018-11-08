class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts


    def most_recent_posts
        sorted_array = self.posts.sort_by do |post|
            post.updated_at
        end
        sorted_array.pop(5)
    end

    def featured_post
        self.posts.sort_by do |post|
            post.likes
        end
        self.posts.last
    end

    def average_age
        total_age = 0
        self.bloggers.each do |blogger|
            total_age += blogger.age 
        end
        total_age / self.bloggers.length

    end
end
