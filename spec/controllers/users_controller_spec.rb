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
            
    end #invalid params
  
  end #create


end
