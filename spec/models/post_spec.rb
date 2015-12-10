require 'spec_helper'
require 'rails_helper'

describe Post do
=begin    fixtures :users
    describe 'is voted by user method' do
        it 'should return false if the current user if nil' do
            allow(Post).to receive(:is_voted_by_user)
            testUser = users(:test_user)
            Post.is_voted_by_user(testUser.id+1, 1)
            expect(response).to eq false
        end
        it 'should return true if the current vote equals 1' do
            testUser = users(:test_user)
            expect(Vote).to receive(:where).and_return(:count => 1)
            Post.is_voted_by_user(testUser.id, 1)
            expect(response).to eq true
        end
        it 'should return false if the current vote equals 0' do
            testUser = users(:test_user)
            expect(Vote).to receive(:where).and_return(:count => 0)
            Post.is_voted_by_user(testUser.id, 1)
            expect(response).to eq true
        end
=end    end
end