require "rails_helper"

RSpec.describe MailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mails").to route_to("mails#index")
    end

    it "routes to #new" do
      expect(:get => "/mails/new").to route_to("mails#new")
    end

    it "routes to #show" do
      expect(:get => "/mails/1").to route_to("mails#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mails/1/edit").to route_to("mails#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mails").to route_to("mails#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mails/1").to route_to("mails#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mails/1").to route_to("mails#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mails/1").to route_to("mails#destroy", :id => "1")
    end

  end
end
