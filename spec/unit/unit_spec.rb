# location: spec/unit/unit_spec.rb
require 'rails_helper'

#unit tests using ytvideo Testing with RSpec
# https://www.youtube.com/watch?v=71eKcNxwxVY
RSpec.describe Member, type: :model do
	context 'validation tests' do
		it 'check name' do
			member = Member.new(isAdmin: false, isOwner: false, totalPoints: '110').save
			expect(member).to eq(false)
		end
		it 'check admin' do
			member = Member.new(name: 'Jack', isOwner: false, totalPoints: '110').save
			expect(member).to eq(true)
		end
		it 'check owner' do
			member = Member.new(name: 'Jack', isAdmin: false, totalPoints: '110').save
			expect(member).to eq(true)
		end
		it 'check points' do
			#member = Member.new(name: 'Jack', isAdmin: false, isOwner: false, totalPoints: '110').save
			member = Member.new(name: 'Jack', isAdmin: false, isOwner: false).save
			expect(member).to eq(true)
		end
	end
end

RSpec.describe MemberPoint, type: :model do
	context 'memberpoints tests' do
		it 'check member id only' do
			@member = Member.create(name: 'Andrew')
			memberpoint = MemberPoint.new(member_id: @member.id, activity_id: 0, event_id: 0).save
			expect(memberpoint).to eq(false)
		end
		it 'check event id only' do
			@activity = Activity.create(name: 'Meeting', num_points: '10')
			@event = Event.create(name: 'General Meeting', activity_id: @activity.id)
			memberpoint = MemberPoint.new(event_id: @event.id, activity_id: 0, member_id: 0).save
			expect(memberpoint).to eq(false)
		end
		it 'check valid input' do
			@activity = Activity.create(name: 'Meeting', num_points: '10')
			@event = Event.create(name: 'General Meeting', activity_id: @activity.id)
			@member = Member.create(name: 'Andrew')
			memberpoint = MemberPoint.new(member_id: @member.id, event_id: @event.id, activity_id: @activity.id).save
			expect(memberpoint).to eq(true)
		end
	end
end	

RSpec.describe Like, type: :model do
	context 'likes unit tests' do
		it 'check post_id only' do
			@member = Member.create(name: 'Andrew')
			@post = Post.create(title: 'test', body: 'test', member_id: @member.id)
			like = Like.new(post_id: @post.id).save
			expect(like).to eq(false)
		end
		it 'check member_id only' do
			@member = Member.create(name: 'Jack')
			like = Like.new(member_id: @member.id).save
			expect(like).to eq(false)
		end
		it 'check valid input' do
			@member = Member.create(name: 'Andrew')
			@post = Post.create(title: 'test', body: 'test', member_id: @member.id)
			like = Like.new(post_id: @post.id, member_id: @member.id).save
			expect(like).to eq(true)
		end
	end
end

Rspec.describe Activity, type: :model do
	context 'activities unit tests' do
		it 'check name only' do
			activity = Activity.new(name: 'Meeting').save
			expect(activity).to eq(false)
		end
		it 'check points only' do
			activity = Activity.new(points: '15').save
			expect(activity).to eq(false)
		end
		it 'check valid input' do
			activity = Activity.new(name: 'Meeting', points: '15').save
			expect(activity).to eq(true)
		end
	end
end


#	subject do
#		described_class.new(title: 'Foundation')
#	end
#	it 'is valid with valid attributes' do
#		expect(subject).to be_valid
#	end
#	it 'is not valid without a name' do
#		subject.title = nil
#		expect(subject).not_to be_valid
#	end
#end
