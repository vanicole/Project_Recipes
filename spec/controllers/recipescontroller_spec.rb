require 'rails_helper'

describe RecipesController, type: :controller do
    fixtures :all
    
    it "should return one recipe from the fixtures" do	
		adm = users(:admin)
		sign_in adm
		get :index
		expect(assigns(:recipes).size).to eql(1)
	end



end
