module NavigationHelpers

    # Used for: When /^(?:|I )go to (.+)$/ do |page_name|

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
  
        when /^the my favorite page$/
            '/users/favorites'
    
        when /^the my recipes page$/
            '/users/myrecipes'
        
        when /^the new recipe page$/
            new_recipe_path
  
        when /^the recipes page$/
            '/recipes'
  
        when /^the users_edit page$/
            edit_user_path(@user)
  
        when /^the users_select page$/
            users_select_path
  
        when /^the admin page$/
            '/adm'
        
        when /^the recipe (.*) page$/
            recipe_path(Recipe.find_by(:title => $1)) 

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