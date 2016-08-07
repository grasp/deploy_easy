# Helper methods defined here can be accessed in any controller or view in the application

module DeployEasy
  class App
    module AccountHelper
      # def simple_helper_method
      # ...
      # end
    # 产生账户编号
      def get_account_number
      	return number=1 if Account.count==0
      	return Account.last.number  #TODO risk here, last is not the last
      end
      
     #用户注册
      def register_user_helper

      confirm=params[:accounts]["password_confirm"]
	    params[:accounts].delete('password_confirm')

      params[:accounts]["role"]="shop_admin"

	    number=get_account_number
	    params[:accounts]["number"]=number

	    #confirm password
	    @account = Account.new(params[:accounts])

	    redirect  url(:accounts,:user_register),:error=>"密码确认不对！"  if params[:accounts]["password"]!=confirm
	    
	    unless Account.where("name"=>params[:accounts]["name"]).first.nil?
	        redirect url(:accounts,:user_register),:error=>"该用户名:#{params[:accounts]["name"]}已经被注册"
	    end

	    unless Account.where("email"=>params[:accounts]["email"]).first.nil?

	        redirect url(:accounts,:user_register),:error=>"该邮箱:#{params[:accounts]['email']}已经被注册"
	    end
	    unless Account.where("mphone"=>params[:accounts]["mphone"]).first.nil?
	        redirect url(:accounts,:user_register),:error=>"该手机:#{params[:accounts]['mphone']}已经被注册"
	    end

      end
    end

    helpers AccountHelper
  end
end
