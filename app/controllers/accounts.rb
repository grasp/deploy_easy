DeployEasy::App.controllers :accounts do
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
  #   "Maps to url '/foo/#                                    {params[:id]}'"
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :index do

  end


  post :register,:map=>"/accounts/user_register" do

      register_user_helper

    if @account.save
      @title = "登录"
      flash[:success] = "恭喜你，成功创建账号！"
      session["name"]=@account.name
      session["account_number"]=@account.number
      session["email"]=@account.email
      logger.info "register succ!"
      redirect_to url("/")

    else
      logger.info "register fail!"
      @title = pat(:create_title, :model => 'account')
      flash.now[:error] = "哎呀，账户创建失败，用户名被占用了"
      render 'accounts/user_register'
    end

    render "registered"
  end


  get :user_register,:map=>"/accounts/user_register" do 


    render "/accounts/user_register"

  end

end
