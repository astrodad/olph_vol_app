require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FamilyTypesController do

  # This should return the minimal set of attributes required to create a valid
  # FamilyType. As you add validations to FamilyType, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FamilyTypesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all family_types as @family_types" do
      family_type = FamilyType.create! valid_attributes
      get :index, {}, valid_session
      assigns(:family_types).should eq([family_type])
    end
  end

  describe "GET show" do
    it "assigns the requested family_type as @family_type" do
      family_type = FamilyType.create! valid_attributes
      get :show, {:id => family_type.to_param}, valid_session
      assigns(:family_type).should eq(family_type)
    end
  end

  describe "GET new" do
    it "assigns a new family_type as @family_type" do
      get :new, {}, valid_session
      assigns(:family_type).should be_a_new(FamilyType)
    end
  end

  describe "GET edit" do
    it "assigns the requested family_type as @family_type" do
      family_type = FamilyType.create! valid_attributes
      get :edit, {:id => family_type.to_param}, valid_session
      assigns(:family_type).should eq(family_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FamilyType" do
        expect {
          post :create, {:family_type => valid_attributes}, valid_session
        }.to change(FamilyType, :count).by(1)
      end

      it "assigns a newly created family_type as @family_type" do
        post :create, {:family_type => valid_attributes}, valid_session
        assigns(:family_type).should be_a(FamilyType)
        assigns(:family_type).should be_persisted
      end

      it "redirects to the created family_type" do
        post :create, {:family_type => valid_attributes}, valid_session
        response.should redirect_to(FamilyType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved family_type as @family_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        FamilyType.any_instance.stub(:save).and_return(false)
        post :create, {:family_type => {}}, valid_session
        assigns(:family_type).should be_a_new(FamilyType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FamilyType.any_instance.stub(:save).and_return(false)
        post :create, {:family_type => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested family_type" do
        family_type = FamilyType.create! valid_attributes
        # Assuming there are no other family_types in the database, this
        # specifies that the FamilyType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FamilyType.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => family_type.to_param, :family_type => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested family_type as @family_type" do
        family_type = FamilyType.create! valid_attributes
        put :update, {:id => family_type.to_param, :family_type => valid_attributes}, valid_session
        assigns(:family_type).should eq(family_type)
      end

      it "redirects to the family_type" do
        family_type = FamilyType.create! valid_attributes
        put :update, {:id => family_type.to_param, :family_type => valid_attributes}, valid_session
        response.should redirect_to(family_type)
      end
    end

    describe "with invalid params" do
      it "assigns the family_type as @family_type" do
        family_type = FamilyType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FamilyType.any_instance.stub(:save).and_return(false)
        put :update, {:id => family_type.to_param, :family_type => {}}, valid_session
        assigns(:family_type).should eq(family_type)
      end

      it "re-renders the 'edit' template" do
        family_type = FamilyType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FamilyType.any_instance.stub(:save).and_return(false)
        put :update, {:id => family_type.to_param, :family_type => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested family_type" do
      family_type = FamilyType.create! valid_attributes
      expect {
        delete :destroy, {:id => family_type.to_param}, valid_session
      }.to change(FamilyType, :count).by(-1)
    end

    it "redirects to the family_types list" do
      family_type = FamilyType.create! valid_attributes
      delete :destroy, {:id => family_type.to_param}, valid_session
      response.should redirect_to(family_types_url)
    end
  end

end
