require 'spec_helper'
require 'rails_helper'

describe PostsController do
    fixtures :posts
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
            expect(Post).to receive(:where).and_return("GoodPost")
            #fake_params = double("fakePost")
            #expect(fake_params).to receive(:permit).and_return("all")
            post :index, :category_id => 3
            expect(assigns(:posts)).to eq "GoodPost"
            expect(response).to render_template('index')
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
            #fake_post = double('post1')
            #fake_post2 = double('post2')
            #expect(Post).to receive(:new).and_return(fake_post)
            #expect(fake_post).to receive(:save).and_return(true)
            #expect(fake_post).to receive(:to_model).and_return(fake_post2)
            #expect(fake_post2).to receive(:persisted?)
            post :create, {:post => {:title => "testing", :body => "Test 123", :thumbnail => "Only a test"}}
            expect(flash[:notice]).to eq "Post was successfully created."
            #expect(response).to redirect_to(fake_post) #make fake post respond to the redirect_to - first check
            #redirect to is wrapped in a url
        end
        it 'might not save the post correctly' do
            fake_post = double('post1')
            expect(Post).to receive(:new).and_return(fake_post)
            expect(fake_post).to receive(:save).and_return(false)
            post :create, {:post => {:title => "testing", :body => "Test 123", :thumbnail => "Only a test"}}
            expect(response).to render_template('new')
        end
    end
    describe 'searching posts' do
        it 'should check for blank search terms' do
            post :search,  {:search_terms => ""}
            expect(response).to_not render_template('search')
        end
        it 'should check for nil search terms' do
            post :search,  {:search_terms => nil}
            expect(response).to_not render_template('search')
        end
        it 'should go to the homepage if no movies were found' do
            #expect(Post).to receive(:all).and_return(posts(:test_post), posts(:test_post2))
            #post :search, {:search_terms => "SELT"}
            #expect(response).to_not render_template('search')
            #expect(response).to render_template('posts/index')
        end
        describe 'after valid search' do
            it 'should select the Search Results template for rendering' do
                #expect(Post).to receive(:all).and_return(posts(:test_post), posts(:test_post2))
                #post :search, {:search_terms => 'post'}
                #expect(response).to render_template('posts/search')
            end
            it 'should make the TMDb search results available to that template' do
                assigns(:posts).should == @fake_post
            end
        end
    end
    describe 'destroy method' do
        it 'should destroy the selected post and redirect back to the homepage' do
            @post_toDelete = posts(:test_post)
            expect(@post_toDelete).to receive(:destroy)
            @post_toDelete.destroy
            expect(response.status).to eq(200)
        end
    end
end