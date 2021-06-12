require 'rails_helper'

describe RecipesController, type: :controller do
    fixtures :all
    
    it "should return one recipe from the fixtures" do	
		adm = users(:admin)
		sign_in adm
		get :index
		expect(assigns(:recipes).size).to eql(1)
	end

    #Bannned Users
	context "with Banned privileges" do
		before :each do
			banned = users(:banned)
			sign_in banned
		end
		
        #Create
		it "should not create recipes" do
			params = {:recipe=>{:title => "Title"}}
			get :create, :params => params
			m_tst = Recipe.where(:title => "Title")
			expect(m_tst).to be_empty
		end

        #Retrieve
		it "should retrieve recipes" do
			r = recipes(:one)
			params = {:id => r.id}
			get :show, :params => params
			expect(assigns(:recipe)).to eql(r)
		end

        #Update
		it "should not update recipes" do
			r = recipes(:one)
			params = {:id => r.id, :recipe=>{:title => "Title"}}
			get :update, :params => params
			r_tst = Recipe.find(r.id)
			expect(r_tst.title).to eql(r.title)
		end

        #Destroy
		it "should not destroy recipes" do
			r = recipes(:one)
			params = {:id => r.id}
			get :destroy, :params => params
			r_tst = Recipe.where(:id => r.id)
			expect(r_tst).not_to be_empty
		end
	end

    #Registered Users
	context "with Registered User privileges" do
		before :each do
			user = users(:registered)
			sign_in user
		end

		#Create
		it "should create recipe" do
			params = {:recipe=>{:title => "Title"}}
			get :create, :params => params
			r_tst = Recipe.where(:title => "Title")
			expect(r_tst).not_to be_empty
		end

		#Retrieve
		it "should retrieve recipes" do
			r = recipes(:one)
			params = {:id => r.id}
			get :show, :params => params
			expect(assigns(:recipe)).to eql(r)
		end

        #Update
		it "should cannot update all recipes" do
			r = recipes(:one)
			params = {:id => r.id, :recipe=>{:title => "Title"}}
			get :update, :params => params
			m_tst = Recipe.find(r.id)
			expect(m_tst.title).to eql(r.title)
		end

		#Destroy
		it "should not destroy recipes" do
			r = recipes(:one)
			params = {:id => r.id}
			get :destroy, :params => params
			m_tst = Recipe.where(:id => r.id)
			expect(m_tst).not_to be_empty
		end
	end

    #Admins
	context "with Admin privileges" do
		before :each do
			admin = users(:admin)
			sign_in admin
		end

		#Create
		it "should create recipes" do
			params = {:recipe=>{:title => "Title"}}
			get :create, :params => params
			r_tst = Recipe.where(:title => "Title")
			expect(r_tst).not_to be_empty
		end
		
        #Retrieve
		it "should retrieve recipes" do
			r = recipes(:one)
			params = {:id => r.id}
			get :show, :params => params
			expect(assigns(:recipe)).to eql(r)
		end

		#Update
		it "should not update recipes" do
			r = recipes(:one)
			params = {:id => r.id, :recipe=>{:title => "Title"}}
			get :update, :params => params
			m_tst = Recipe.find(r.id)
			expect(m_tst.title).to eql(r.title)
		end

		#Delete
		it "should destroy recipes" do
			r = recipes(:one)
			params = {:id => r.id}
			get :destroy, :params => params
			m_tst = Recipe.where(:id => r.id)
			expect(m_tst).to be_empty
		end
	end

end
