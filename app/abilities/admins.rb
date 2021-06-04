Canard::Abilities.for(:admin) do
  can [:create, :update, :destroy], Recipe
  
  can [:create, :update, :destroy], Review
  
end
