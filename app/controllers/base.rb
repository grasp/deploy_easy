DeployEasy::App.controllers :base do


  logger.info "layout:#{File.expand_path("../../views/layouts/application",__FILE__)}"
  layout File.expand_path("../../views/layouts/application",__FILE__)
  #layout File.expand_path("../../views/layouts/application",__FILE__)
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :home,:map=>"/" do

   


    render "base/home"

  end

  get :base_home,:map=>"base/home" do 


    render "base/home"

  end


  get :help,:map=>"/base/helps" do 


    render "base/helps"

  end

end
