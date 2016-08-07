DeployEasy::App.controllers :sessions do
  layout File.expand_path("../../views/layouts/application",__FILE__)
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

  get :new_manage,:map=>"/sessions/new_manage" do
    render "/sessions/new2"
  end

  post :session_manage,:map=>"/sessions/session_manage" do

    if account = Account.authenticate(params[:email], params[:password])
      set_current_account(account)
      
      #会话信息
      session["name"]=account.name
      session["account_number"]=account.number
      session["email"]=account.email

      logger.info "#{params} login successfully"
      redirect url(:base,:home)

    else
      logger.info "#{params} login fail"
      params[:email] = h(params[:email])
      flash[:error] = "登录失败,用户名不存在，或者密码不对."
      redirect_to url(:sessions,:new_manage)
     # render "/sessions/new2", nil, :layout => false
    end
    
  end

  post :destroy_manage,:map=>"/sessions/destroy_manage"  do
    set_current_account(nil)
    session["mphone"]=nil
    session["name"]=nil
    redirect url("/")
  end
  

end
