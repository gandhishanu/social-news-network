require 'spec_helper'
require 'rails_helper'

describe PostsController do
=begin
    describe 'searching TMDb' do
        it 'should check for invalid search terms' do
            #place in nil or blank and it should redirect the user to the homepage
            #Check for flash with "Invalid search term"
            #Check if its back on the main page
            post :search_tmdb, {:search => {:search_terms => ''}}
            expect(response).to_not render_template('search_tmdb')
        end
        it 'should go back to the homepage if no movies were found' do
            allow(Movie).to receive(:find_in_tmdb)
            #post :search_tmdb, {:search => {:search_terms => 'SELTUnchained'}}
            expect(Movie).to receive(:find_in_tmdb).with('SELTUnchained').and_return(nil)
            expect(response).to_not render_template('search_tmdb')
        end
        it 'should call the model method that performs TMDb search' do
            fake_results = [double('movie1'), double('movie2')]
            expect(Movie).to receive(:find_in_tmdb).with('Ted').and_return(fake_results)
            post :search_tmdb, {:search => {:search_terms => 'Ted'}}
        end
        describe 'after valid search' do
            it 'should select the Search Results template for rendering' do
                allow(Movie).to receive(:find_in_tmdb)
                post :search_tmdb, {:search => {:search_terms => 'Ted'}}
                expect(response).to render_template('search_tmdb')
            end 
            it 'should make the TMDb search results available to that template' do
                assigns(:movies).should == @fake_results
            end
        end
    end
=end
    describe 'index method' do
        it 'should set the posts variable to all the posts' do
            post :index
            assigns(:posts).should == Post.all
            expect(response).to render_template('posts/index')
        end
    end
    describe 'new method' do
        it 'should call the method new for the post model' do
            post :new
            expect(response).to render_template('posts/new')
        end
    end
    describe 'create method' do
        it 'should save the post with the parameters given' do
            post :create, {:post => {:title => "testing", :body => "Test 123", :thumbnail => "Only a test"}}
            fake_post = double(Post.new, {:post => {:title => "testing", :body => "Test 123", :thumbnail => "Only a test"}})
            expect(Post).to receive(:new).and_return(fake_post, :save => true)
            expect(response).to redirect_to('/posts/1')
        end
        it 'might not save the post correctly' do
             post :create, {:post => {:title => "testing", :body => "Test 123", :thumbnail => "Only a test"}}
            fake_post = double(Post.new, {:post => {:title => "testing", :body => "Test 123", :thumbnail => "Only a test"}})
            expect(Post).to receive(:new).and_return(fake_post, :save => false)
            expect(response).to redirect_to('posts/new')
        end
    end
    describe 'destroy method' do
        it 'should destroy the selected post and redirect back to the homepage' do
            post :destroy
            expect(Post).to receive(:destroy)
            expect(response).to redirect_to('posts/index')
        end
    end
    describe 'searching posts' do
        it 'should check for invalid search terms' do
            post :search,  {:search_terms => ''}
            expect(response).to_not render_template('search')
        end
        it 'should go to the homepage if no movies were found' do
            post :search, {:search_terms => "SELT"}
            assigns(:posts).should == Post.all
            expect(response).to_not render_template('search')
            expect(response).to render_template('posts/index')
        end
        describe 'after valid search' do
            it 'should select the Search Results template for rendering' do
                post :search, {:search_terms => 'Test'}
                fake_post = double(Post.new, {:post => {:title => "testing", :body => "Test 123", :thumbnail => "Only a test"}})
                expect(Post).to receive(:all).and_return(fake_post)
                expect(response).to render_template('posts/search')
            end
            it 'should make the TMDb search results available to that template' do
                assigns(:posts).should == @fake_post
            end
        end
    end
end