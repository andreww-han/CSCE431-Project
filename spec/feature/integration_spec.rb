# location: spec/feature/integration_spec.rb
require 'rails_helper'


#test for selecting members
RSpec.describe 'test member priv', type: :feature do
	scenario 'valid non-admin' do
		visit new_member_path
		fill_in 'Name', with: 'Jack'
		select false, :from => 'member_isAdmin'
		select false, :from => 'member_isOwner'
		click_on 'Create Member'
		visit members_path
		expect(page).to have_content(false)
		expect(page).to have_content(false) #fail if true
	end
end

#FIXME true/false x2
RSpec.describe 'test admin priv', type: :feature do
	scenario 'valid admin' do
		visit new_member_path
		fill_in 'Name', with: 'John'
		select true, :from => 'member_isAdmin'
		select false, :from => 'member_isOwner'
		click_on 'Create Member'
		visit members_path
		expect(page).to have_content(false)
	end
end

#FIXME true/false order x2
RSpec.describe 'test owner priv', type: :feature do
	scenario 'valid owner' do
		visit new_member_path
		fill_in 'Name', with: 'Jen'
		select false, :from => 'member_isAdmin'
		select true, :from => 'member_isOwner'
		click_on 'Create Member'
		visit members_path
		expect(page).to have_content(true)
		expect(page).to have_content(false)
	end
end

RSpec.describe 'test points', type: :feature do
	scenario 'valid points' do
		visit new_member_path
		fill_in 'Name', with: 'Jacob'
		select false, :from => 'member_isAdmin'
		select false, :from => 'member_isOwner'
		fill_in 'member_totalPoints', with: '110'
		click_on 'Create Member'
		visit members_path
		expect(page).to have_content('110')
	end
end

RSpec.describe 'test likes', type: :feature do
	scenario 'valid inputs'do
		visit new_member_path
		fill_in 'member_name', with: 'Andrew'
		click_on 'Create Member'
		visit new_post_path
		fill_in 'title', with: 'test'
		fill_in 'body', with: 'this is a test'
		click_on 'Create Post'
		visit new_like_path
		fill_in 'member_id', with: '1'
		fill_in 'post_id', with: '1'
		click_on 'Create Like'
		visit post_path
		expect(page).to have_content('1')
	end
end

RSpec.describe 'test activities', type: :feature do
	scenario 'valid inputs' do
		visit new_activity_path
		fill_in 'name', with: 'Meeting'
		fill_in 'points', with: '10'
		click_on 'Create Activity'
		visit activity_path
		expect(page).to have_content('Meeting')
	end
end

