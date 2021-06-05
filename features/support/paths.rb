module NavigationHelpers

    def path_to(page_name)
        case page_name
  
        when /^the home\s?page$/
            '/'
  
        when /^the users page$/
            '/users'
  
        when /^the login page$/
            '/users/sign_in'
  
        when /^the sign up page$/
            '/users/sign_up'
  
        when /^the myfavorite page$/
            '/users/favorites'
    
        when /^the myrecipes page$/
            '/users/myrecipes'
  
        when /^the recipes page$/
            '/recipes'
  
        when /^the user (.*) profile page$/
            byebug
            '/users/'+User.find_by(:email => $1).id.to_s
  
        when /^the users_edit page$/
            edit_user_path(@user)
  
        when /^the users_select page$/
            users_select_path
  
        when /^the admin page$/
            '/adm'
  
        when /^the scannedtokens_show\s?page$/
            '/scannedtokens/show'
  
        when /^the user_token page$/
            user_token_path(@user, @user.tokens.first)

        when /^the recipe (.*) reviews page$/
            recipe_reviews_path(Recipe.find_by(:name => $1))
      
  
      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #   when /^(.*)'s profile page$/i
      #     user_profile_path(User.find_by_login($1))
  
        else
            begin
                page_name =~ /^the (.*) page$/
                path_components = $1.split(/\s+/)
                self.send(path_components.push('path').join('_').to_sym)
            rescue NoMethodError, ArgumentError
                raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                    "Now, go and add a mapping in #{__FILE__}"
            end
        end
    end
end
  
World(NavigationHelpers)