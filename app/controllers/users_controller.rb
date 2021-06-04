class UsersController < ApplicationController
    def favorites
        authenticate_user!
        @recipes = current_user.favorites
    end

    def myrecipes 
        authenticate_user!
        @recipes = current_user.recipes 
    end
end
    