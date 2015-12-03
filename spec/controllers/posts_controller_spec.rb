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
        fixtures :posts
        it 'should check for blank search terms' do
            post :search,  {:search_terms => ""}
            expect(response).to_not render_template('search')
        end
        it 'should check for nil search terms' do
            post :search,  {:search_terms => nil}
            expect(response).to_not render_template('search')
        end
        it 'should go to the homepage if no movies were found' do
            testPost = posts(:test_post)
            testPost2 = posts(:test_post2)
            testArray = Array.new
            testArray.push(testPost)
            testArray.push(testPost2)
            expect(Post).to receive(:all).and_return(testArray).twice#(:test_post), posts(:test_post2))
            post :search, {:search_terms => "SELT"}
            expect(response).to_not render_template('search')
            expect(response).to render_template('posts/index')
        end
        describe 'after valid search' do
            it 'should select the Search Results template for rendering' do
                testPost = posts(:test_post)
                testPost2 = posts(:test_post2)
                testArray = Array.new
                testArray.push(testPost)
                testArray.push(testPost2)
                expect(Post).to receive(:all).and_return(testArray)
                post :search, {:search_terms => 'test'}
                expect(response).to render_template('posts/search')
            end
            it 'should make the TMDb search results available to that template' do
                assigns(:posts).should == @fake_post
            end
        end
    end
    describe 'destroy method' do
        fixtures :posts
        it 'should destroy the selected post and redirect back to the homepage' do
            @post_toDelete = posts(:test_post)
            expect(@post_toDelete).to receive(:destroy)
            @post_toDelete.destroy
            expect(response.status).to eq(200)
        end
    end
=begin    describe 'update method' do
        fixtures :posts
        describe "PATCH #update" do
          context "with good data" do
            it "updates the wallet and redirects" do
              patch :update, id: @post.id, post: { title: "xyz", body: "testing", thumbnail: "202"}
              expect(response).to be_redirect
            end
          end
          context "with bad data" do
            it "does not change the wallet, and re-renders the form" do
              patch :update, id: @post.id, post: { title: "xyz", body: "testing"}
              expect(response).not_to be_redirect
            end
          end
        end
        describe 'update successfully' do
            it 'should load the html page if specfied' do
                #testPost = posts(:test_post)
                #expect(testPost).to receive(update).and_return(true)
                #testPost.update
                my_model = stub_model(Post,:update=>true)
                Post.stub(:update).with({:title => "testing", :body => "Test 123", :thumbnail => "Only a test"}) { my_model }
                post :update, :my_model => {:title => "testing", :body => "Test 123", :thumbnail => "Only a test"}, :format => :json
                #response.body.should == my_model.to_json
                response.header['Content-Type'].should include 'application/json'
            end
            it 'should load the xml page if specified' do
                testPost = posts(:test_post)
                expect(testPost).to receive(update).and_return(true)
                testPost.update
            end
        end
        describe 'not updated sucessfully' do 
            it 'should load the html page if specfied' do
                testPost = posts(:test_post)
                expect(testPost).to receive(update).and_return(false)
                testPost.update
            end
            it 'should load the xml page if specified' do
                testPost = posts(:test_post)
                expect(testPost).to receive(update).and_return(fals)
                testPost.update
            end
        end
=end    end
    describe 'flagpost method' do
        fixtures :posts
        it 'should flag the post and then send the user back to the homepage' do
            testPost = posts(:test_post)
            expect(posts(:test_post)).to receive(:save)
            expect(Post).to receive(:find).and_return(testPost)
            post :flagpost, {:params => {:id => 1}}
            expect(testPost[:flagpost]).to eq true
            #expect(response).to redirect_to(post_path) #render_template('posts/search')
        end
    end
end