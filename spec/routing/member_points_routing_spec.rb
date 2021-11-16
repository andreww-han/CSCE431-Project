require 'rails_helper'

RSpec.describe MemberPointsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/member_points').to route_to('member_points#index')
    end

    it 'routes to #new' do
      expect(get: '/member_points/new').to route_to('member_points#new')
    end

    it 'routes to #show' do
      expect(get: '/member_points/1').to route_to('member_points#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/member_points/1/edit').to route_to('member_points#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/member_points').to route_to('member_points#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/member_points/1').to route_to('member_points#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/member_points/1').to route_to('member_points#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/member_points/1').to route_to('member_points#destroy', id: '1')
    end
  end
end
