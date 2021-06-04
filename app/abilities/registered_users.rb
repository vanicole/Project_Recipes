Canard::Abilities.for(:registeredUser) do
  can [:create, :update, :favorite], Recipe
  cannot [:destroy], Recipe
  can [:create], Review
  cannot [:destroy], Review
end
