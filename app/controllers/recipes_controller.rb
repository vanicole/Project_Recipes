class RecipesController < ApplicationController

    #skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, except: [:show, :index, :results]


    def index
        @recipes = Recipe.all.order('created_at DESC')
    end

    # CREATE 1/2
    def new
        @recipe = current_user.recipes.new
    end

    # CREATE 2/2
    def create
        @recipe = current_user.recipes.create(recipe_params)
        @recipe.video = Video.new(video_params).save
        if @recipe.save
            flash[:notice] = "#{@recipe.title} has been successfully created!"
            redirect_to recipe_path(@recipe)
        else
            render :new 
        end
    end


    # READ ONE
    def show
        @recipe = Recipe.find(params[:id])
    end

    # UPDATE
    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update 
        @recipe = Recipe.find(params[:id])
        if !(params[:recipe][:link].blank?) && (params[:recipe][:link] != @recipe.link)
            @recipe.video = Video.new(video_params)
        end

        if @recipe.update(recipe_params) 
            flash[:notice] = "#{@recipe.title} has been successfully changed!"
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy 
        flash[:notice] = "#{@recipe.title} has been successfully deleted!"
        redirect_to root_path
    end        

    def favorite
        @recipe = Recipe.find(params[:id])
        type = params[:type]
        if type == "favorite"
          current_user.favorites << @recipe
          redirect_to recipes_path, notice: "You favorited #{@recipe.title}"
    
        elsif type == "unfavorite"
          current_user.favorites.delete(@recipe)
          redirect_to recipes_path, notice: "Unfavorited #{@recipe.title}"
    
        else
          # Type missing, nothing happens
          redirect_to recipes_path, notice: 'Nothing happened.'
        end
    end

    def results
        @keywords = params[:words]
        @category = params[:category]
        @orderby = params[:orderby]

        if @category != ""
            @recipes = Recipe.where("title like ? and category like ?", "%#{@keywords}%", "#{@category}")
        else
            @recipes = Recipe.where("title like ?", "%#{@keywords}%")
        end
        
        if (@orderby == 'A-Z')
            @recipes = @recipes.sort_by(&:title)
        elsif (@orderby == 'Top rating') 
            @recipes = @recipes.sort_by{|recipe| recipe.averageScore}.reverse
        end
    end
    
    private
    def recipe_params 
        params.require(:recipe).permit(:title, :description, :category, :dosage, :difficulty, :preparation, :ingredients, :steps, :user, :image, :image_cache, :remove_image, :link, :video_id)
    end

    def video_params
        params.require(:recipe).permit(:link)
    end
end