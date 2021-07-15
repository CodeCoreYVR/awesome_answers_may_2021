require 'rails_helper'

RSpec.describe JobPostsController, type: :controller do
    describe "#new" do
        it "renders the new template" do
            #GIVEN - there is no given code for this test, just given the action on pressing the button
            # or clicking a link to render a new page

            #WHEN
            get(:new) #we have this get method from rails-controller-testing, which is made magically by this get method, and we don't have to create it manually. This
            #will be mocked. The Rspec-rails gem gives us thid method to "mock" a request to the new action. More info at https://rspec.info/documentation/4.0/rspec-rails/RSpec/Rails/Matchers/RoutingMatchers/RouteHelpers.html#get-instance_method
        
            #THEN
            expect(response).to(render_template(:new))
            #response is an object that represents the HTTP-Response
            #Rspec makes this object available within the specs
            #We verify that the response will render out the template "new" using the matcher 'render_template'
        end

        it "sets an instance variable with a new job post" do
            #GIVEN - again, no code, just given the new action

            #WHEN
            get(:new)

            #THEN
            #assigns(:job_post) available from the rails-controller-testing gem. It allows us to grab an instance variable, it takes a symbol of a resource (:job_post)
            #All the models are available to controllers
            expect(assigns(:job_post)).to(be_a_new(JobPost))
            #we cheack that the instance variable @job_post is a new instance of the Class JobPost (Model)
        end
    end

end
