class UsersController < ApplicationController
  #before_filter :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  helper_method :convert_video_platform

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
	@photos = Photo.where(user_id: params[:id]).order(created_at: :desc).limit(6)
  end

  # GET /users/new
  def new
    @user = User.new
    @companies = Company.all
  end

  # GET /users/1/edit
  def edit
	@users = User.all
	@user_blank = User.new
	@user_blank.first_name = "Root"
	@user_blank.last_name = "aaaaa"
	@user_blank.id = 0
	@companies = Company.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @companies = Company.all

    respond_to do |format|
      if @user.save
	    #UserMailer.registration_confirmation_onboard(@user).deliver
        format.html { redirect_to @user, notice: 'Verification Email sent to your email' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
	@companies = Company.all
	
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
	 User.import(params[:file],Company.find(params[:company_id]))
	 redirect_to users_url, notice: "Users were successfully imported." 
  end
  
  def convert_video_platform(num)
	  humanized_numbers = {"0" => "Skype", 
		  				   "1" => "Adobe Connect", 
		  				   "2" => "Google Hangout", 
		  				   "3" => "Cisco WebEx", 
		  				   "4" => "Citrix GoToMeeting",
		  				   "5" => "Polycom",
		  				   "6" => "Zoom",
		  				   "7" => "Facetime"}
	  humanized_numbers[num.to_s]
  end
  
  def nouser
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      #@user = User.find(params[:id])
      begin
	  	@user = User.find(params[:id])
	  rescue ActiveRecord::RecordNotFound => e
	  	respond_to do |format|
	  		format.html { redirect_to root_url, notice: "User doesn't exist." }
	  		format.json { render json: @user.errors, status: :unprocessable_entity }
	    end
	  end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :company_id, :image, :role, :manager_id, :mobile_phone, :work_phone, :start_date, :video_platform, :video_handle, :about_me, :resp)
    end
end
