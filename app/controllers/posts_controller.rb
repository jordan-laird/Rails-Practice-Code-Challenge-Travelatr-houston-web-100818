class PostsController < ApplicationController
    before_action :current_post

    def like
        @post.like_button
        redirect_to @post
    end

    def create
        @post = Post.create(posts_params)
        redirect_to post_path(@post)
    end

     def update
        @post.update(posts_params)
        redirect_to post_path(@post)
    end

    def posts_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def current_post
        if params[:id]
            @post = Post.find(params[:id]) 
        else
            @post = Post.new
        end
    end
end
