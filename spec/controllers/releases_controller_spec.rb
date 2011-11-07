require 'spec_helper'

describe ReleasesController do
  describe "#index" do
    context "xml" do
      render_views
      
      before(:each) do
        @published_release = Factory.create(:release, :title => "Venice", :published => true)
        @unpublished_release = Factory.create(:release, :title => "TBA", :published => false) 
        request.env['HTTP_ACCEPT'] = 'application/xml'
        get :index
        @xml_doc = Nokogiri::XML(response.body)
      end
      
      it "should render xml" do
        response.content_type.should == 'application/xml'
      end
      
      it "should have a root element named 'releases'" do
        @xml_doc.root.name.should == "releases"
      end
      
      it "should have a root element of type 'array'" do
        @xml_doc.root.attr("type").should == "array"
      end
      
      it "should contain all published releases in the catalogue" do
        @xml_doc.xpath("//release").count.should == Release.published.count
      end
      
      it "should only contain published releases" do
        @xml_doc.xpath("//release/title").inner_html.should == @published_release.title
      end
    end
  end
end