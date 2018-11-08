class BloggersController < ApplicationController
    
    before_action :current_blogger
    
    def index
        @bloggers = Blogger.all
    end

    def create
        @blogger= Blogger.create(blogger_params)
        # if @blogger.valid?
        #     @blogger.save
            redirect_to blogger_path(@blogger)
        # else
        #     # TODO something will happen
        # end
    end

    # def edit
    #     @blogger = Blogger.find(params[:id])
    # end

    def update
        @blogger= Blogger.update(blogger_params)
        # if @blogger.valid?
            redirect_to blogger_path(@blogger)
        # else
        #     # TODO something will happen
        # end

    end

    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end

    def current_blogger
        if params[:id]
            @blogger = Blogger.find(params[:id])
        else
            @blogger = Blogger.new
        end
    end
end
