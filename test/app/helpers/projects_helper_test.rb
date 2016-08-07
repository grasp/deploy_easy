require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "DeployEasy::App::ProjectsHelper" do
  before do
    @helpers = Class.new
    @helpers.extend DeployEasy::App::ProjectsHelper
  end

  def helpers
    @helpers
  end

  it "should return nil" do
    assert_equal nil, helpers.foo
  end
end
