require 'spec_helper'

describe 'Site Status' do

  context "action here" do

it "Should not raise error" do
sitestatus = SiteStatus.new("unece.yml")
sitestatus.site_xpath_yaml.should == "unece.yml"
    end
    it "Should raise error" do
 SiteStatus.new("unsece.yml").site_xpath_yaml.should ==  nil
    end
  end
 

end
