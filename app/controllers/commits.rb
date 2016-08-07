DeployEasy::App.controllers :commits do
  
get :index do
    @title = "Commits"
    @commits = Commit.all
    render 'commits/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'commit')
    @commit = Commit.new
    render 'commits/new'
  end

  post :create do
    @commit = Commit.new(params[:commit])
    if @commit.save
      @title = pat(:create_title, :model => "commit #{@commit.id}")
      flash[:success] = pat(:create_success, :model => 'Commit')
      params[:save_and_continue] ? redirect(url(:commits, :index)) : redirect(url(:commits, :edit, :id => @commit.id))
    else
      @title = pat(:create_title, :model => 'commit')
      flash.now[:error] = pat(:create_error, :model => 'commit')
      render 'commits/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "commit #{params[:id]}")
    @commit = Commit.find(params[:id])
    if @commit
      render 'commits/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'commit', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "commit #{params[:id]}")
    @commit = Commit.find(params[:id])
    if @commit
      if @commit.update_attributes(params[:commit])
        flash[:success] = pat(:update_success, :model => 'Commit', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:commits, :index)) :
          redirect(url(:commits, :edit, :id => @commit.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'commit')
        render 'commits/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'commit', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Commits"
    commit = Commit.find(params[:id])
    if commit
      if commit.destroy
        flash[:success] = pat(:delete_success, :model => 'Commit', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'commit')
      end
      redirect url(:commits, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'commit', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Commits"
    unless params[:commit_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'commit')
      redirect(url(:commits, :index))
    end
    ids = params[:commit_ids].split(',').map(&:strip)
    commits = Commit.find(ids)
    
    if commits.each(&:destroy)
    
      flash[:success] = pat(:destroy_many_success, :model => 'Commits', :ids => "#{ids.join(', ')}")
    end
    redirect url(:commits, :index)
  end

end
