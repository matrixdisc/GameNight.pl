class UserSettingsController < ApplicationController

  # GET /user_settings/1
  # GET /user_settings/1.xml



  # GET /user_settings/1/edit
  def edit
    @user_setting = UserSettings.find_by_user_id(current_user.id)
  end

  def show
    render :action => "edit"
  end

  # PUT /user_settings/1
  # PUT /user_settings/1.xml
  def update
    @user_settings = UserSettings.find(params[:id])

    respond_to do |format|
      if @user_settings.update_attributes(params[:user_settings])
        flash[:mood] = "positive"
        format.html { redirect_to(root_path, :notice => 'User settings were successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

end
