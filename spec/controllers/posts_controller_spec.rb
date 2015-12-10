require 'spec_helper'
require 'rails_helper'

describe PostsController do
    fixtures :users
    fixtures :posts
   
    describe 'index method' do
        it 'should set the posts variable to all the posts' do
            post :index, :category_id => 1
            expect(assigns(:posts))
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
        it 'should not save the post if not logged in' do
            post :create, {:post => {:title => "testing", :body => "Test 123", :thumbnail => "Only a test"}}
            expect(flash[:notice]).to eq "Login to create a new post."
        end
        it 'should save the post with the parameters given if logged in' do
            controller.instance_variable_set(:@current_user, users(:test_user))
            post :create, {:post => {:title => "testing", :body => "Test 123", :thumbnail => "Only a test"}}
            expect(flash[:notice]).to eq "Post was successfully created."
        end
        it 'might not save the post correctly' do
            controller.instance_variable_set(:@current_user, users(:test_user))
            fake_post = posts('test_post')
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
        it 'should go to the homepage if no posts were found' do
            testPost = posts(:test_post)
            testPost2 = posts(:test_post2)
            testArray = Array.new
            testArray.push(testPost)
            testArray.push(testPost2)
            ActiveArray = double("ActiveArray")
            expect(Post).to receive(:order).and_return(ActiveArray).twice
            expect(ActiveArray).to receive(:all).and_return(testArray).twice#(:test_post), posts(:test_post2))
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
                ActiveArray2 = double("ActiveArray2")
                expect(Post).to receive(:order).and_return(ActiveArray2)
                expect(ActiveArray2).to receive(:all).and_return(testArray)
                post :search, {:search_terms => 'test'}
                expect(response).to render_template('posts/search')
            end
            it 'should make the TMDb search results available to that template' do
                expect(assigns(:posts)).to eq @fake_post
            end
        end
    end
    describe 'edit method' do
        it 'should redirect to the post_path if the user who created the post doesnt match the current user' do
            controller.instance_variable_set(:@current_user, users(:test_user))
            controller.instance_variable_set(:@post, posts(:test_post))
            post :edit, {id: posts(:test_post)}
            expect(response).to redirect_to("/posts/#{posts(:test_post).id}")
        end
        it 'should continue the application if the user who created the post matches the current user' do
            testPost = posts(:test_post)
            testUser = users(:test_user)
            testPost.user_id = testUser.id
            controller.instance_variable_set(:@current_user, testUser)
            controller.instance_variable_set(:@post, testPost)
            post :edit, {id: testPost}
            expect(response).to redirect_to("/posts/#{testPost.id}")
        end
    end
    describe 'destroy method' do
        it 'should destroy the selected post and redirect back to the homepage if it was your post' do
            testPost = posts(:test_post)
            testUser = users(:test_user)
            testPost.user_id = testUser.id
            controller.instance_variable_set(:@current_user, testUser)
            controller.instance_variable_set(:@post, testPost)
            expect(testPost).to receive(:destroy)
            expect(Post).to receive(:find).and_return(testPost)
            post :destroy, {id: testPost}
            expect(response.status).to eq(302)
        end
        it 'should not destroy the post if it was not the users post' do
            testPost = posts(:test_post)
            testUser = users(:test_user)
            testPost.user_id = testUser.id+2
            controller.instance_variable_set(:@current_user, testUser)
            controller.instance_variable_set(:@post, testPost)
            expect(Post).to receive(:find).and_return(testPost)
            expect(testPost).not_to receive(:destroy)
            post :destroy, {id: testPost}
            expect(response.status).to eq(302)
        end
        it 'should not destroy the post if no user is logged in' do
            testPost = posts(:test_post)
            controller.instance_variable_set(:@current_user, nil)
            controller.instance_variable_set(:@post, testPost)
            expect(Post).to receive(:find).and_return(testPost)
            expect(testPost).not_to receive(:destroy)
            post :destroy, {id: testPost}
            expect(response.status).to eq(302)
        end
    end
    describe 'show method' do
        it 'should set the @comment to a new comment' do
            expect(Comment).to receive(:new).and_return("Yes")
            get :show,  {id: posts(:test_post)}
            expect(controller.instance_variable_get("@comment")).to eq "Yes"
            expect(controller.instance_variable_get("@post")).to eq posts(:test_post)
        end
    end
    describe 'update method' do
        describe 'have the right permission' do
            it 'should update the post properly' do
                testPost = posts(:test_post)
                testUser = users(:test_user)
                testPost.user_id = testUser.id
                controller.instance_variable_set(:@current_user, testUser)
                controller.instance_variable_set(:@post, testPost)
                expect(Post).to receive(:find).and_return(testPost)
                expect(testPost).to receive(:update).and_return(true)
                post :update, {id: testPost, :post => {:title => "Still a test", :body => "Just testing", :thumbnail => "test", :user_id => testUser.id}}
                expect(response.status).to eq(302)
                expect(flash[:notice]).to eq "Post was successfully updated."
            end
            it 'may not update properly' do
                testPost = posts(:test_post)
                testUser = users(:test_user)
                testPost.user_id = testUser.id
                controller.instance_variable_set(:@current_user, testUser)
                controller.instance_variable_set(:@post, testPost)
                expect(Post).to receive(:find).and_return(testPost)
                expect(testPost).to receive(:update).and_return(false)
                post :update, {id: testPost, :post => {:title => "Still a test", :body => "Just testing", :thumbnail => "test", :user_id => testUser.id}}
                expect(response.status).to eq(200)
                expect(flash[:notice]).to eq nil
            end
        end
        it 'should not update the post without a user logged in' do
            testPost = posts(:test_post)
            controller.instance_variable_set(:@post, testPost)
            expect(Post).to receive(:find).and_return(testPost)
            expect(testPost).not_to receive(:update)
            post :update, {id: testPost, :post => {:title => "Still a test", :body => "Just testing", :thumbnail => "test", :user_id => 1}}
            expect(response.status).to eq(200)
            expect(flash[:notice]).to eq nil
        end
        it 'should not update the post when a different user is logged in' do
            testPost = posts(:test_post)
            testUser = users(:test_user)
            testPost.user_id = testUser.id+2
            controller.instance_variable_set(:@current_user, testUser)
            controller.instance_variable_set(:@post, testPost)
            expect(Post).to receive(:find).and_return(testPost)
            expect(testPost).not_to receive(:update)
            post :update, {id: testPost, :post => {:title => "Still a test", :body => "Just testing", :thumbnail => "test", :user_id => testUser.id}}
            expect(response.status).to eq(200)
            expect(flash[:notice]).to eq nil
        end
    end
    describe 'flagpost method' do
        it 'should flag the post and then redirect to the post' do
            testPost = posts(:test_post)
            expect(posts(:test_post)).to receive(:save)
            expect(Post).to receive(:find).and_return(testPost)
            post :flagpost, {:params => {:id => 1}}
            expect(testPost[:flagpost]).to eq true
            expect(response).to redirect_to("/posts/#{testPost.id}")
        end
    end
end