require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
	# pending "reason"

	let!(:user) { FactoryGirl.create :user }

	describe 'current_user' do
		before :all do
			# byebug
			# @user = FactoryGirl.create :user
		end

		it 'returns right user when session is nil' do
			remember(user)
			expect(user).to eq current_user
			expect(is_logged_in?).to be true
		end

		it 'returns nil when remember digest is wrong' do
			user.update_attribute(:remember_digest, User.digest(User.new_token))
			expect(current_user).to be_nil
		end
	end
end
