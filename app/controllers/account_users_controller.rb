class AccountUsersController < ApplicationController
  before_action :set_account_user, only: [:show, :edit, :update, :destroy]

  # GET /account_users
  # GET /account_users.json
  def index
    @account_users = AccountUser.all
  end

  # GET /account_users/1
  # GET /account_users/1.json
  def show
  end

  # GET /account_users/new
  def new
    @account_user = AccountUser.new
  end

  # GET /account_users/1/edit
  def edit
  end

  # POST /account_users
  # POST /account_users.json
  def create
    @account_user = AccountUser.new(account_user_params)

    respond_to do |format|
      if @account_user.save
        format.html { redirect_to @account_user, notice: 'Account user was successfully created.' }
        format.json { render :show, status: :created, location: @account_user }
      else
        format.html { render :new }
        format.json { render json: @account_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_users/1
  # PATCH/PUT /account_users/1.json
  def update
    respond_to do |format|
      if @account_user.update(account_user_params)
        format.html { redirect_to @account_user, notice: 'Account user was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_user }
      else
        format.html { render :edit }
        format.json { render json: @account_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_users/1
  # DELETE /account_users/1.json
  def destroy
    @account_user.destroy
    respond_to do |format|
      format.html { redirect_to account_users_url, notice: 'Account user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_user
      @account_user = AccountUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_user_params
      params.require(:account_user).permit(:account_id, :user_id, :privilege)
    end
end
