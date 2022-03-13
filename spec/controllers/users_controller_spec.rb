require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#create" do
    context "with valid parameters" do
      def valid_request
        post(:create, params: { user: 
          FactoryBot.attributes_for(:user)
        })
      end
      
      it "require a new user record in the users table" do
        count_before = User.count
        valid_request
        count_after = User.count
        expect(count_after).to(eq(count_before + 1))
      end

    end #valid params
    
    context "with invalid parameters" do
      def invalid_request
        post(:create, params: { user: 
          FactoryBot.attributes_for(:user, email: nil)
        })
      end  
      it "require no new user record saved in the users table" do
        count_before = User.count
        invalid_request
        count_after = User.count
        expect(count_after).to(eq(count_before))
      end                
    end #invalid params
  
  end #create

  describe "#update" do
      before do
          @user = FactoryBot.create(:user)
      end

      context "with valid parameters" do
        it "requires an update of the user record with new attributes" do
          new_first_name = "#{@user.first_name} Mickey"

          patch(:update, params: { id: @user.id, user: {first_name: new_first_name}})
          expect(@user.reload.first_name).to eq(new_first_name)
        end         
      end #valid params

      context "with invalid parameters" do
          
      end #valid params
  end #update


end
