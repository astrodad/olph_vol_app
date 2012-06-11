class AccountsController < ApplicationController

  include SessionsHelper
  
  before_filter :signed_in_account, only: [:edit, :update, :show]
  before_filter :correct_account,   only: [:edit, :update]
  before_filter :admin_account,     only: [:index]
  
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show


    @account = Account.find(params[:id])
    @workers = @account.workers

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  
  def new

    @account = Account.new
    @account.creating_account = true
    
    3.times { @account.workers.build}


  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])

      
      difference = 3 - @account.workers.count

      if difference > 0
        difference.times { @account.workers.build}
      end
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])
    @account.updating_password = true

    if @account.save
      sign_in @account
      flash[:success] = "Account created successfully!"
      redirect_to @account
    else
      render 'new'
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|

      # If the current account is an admin user but not the account that is being modified,
      # they will not have entered a password and we should just aassign the current password values
      # to the account.

    if current_account == @account
      @account.updating_password = true
    end

    logger.debug "Token 1: #{@account.remember_token}"

    if @account.update_attributes(params[:account])
        logger.debug "Token 2: #{@account.remember_token}"
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }

      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end
end

private

  def correct_account

      logger.debug "-----inside correct account---"
      @account = Account.find(params[:id])
      
      redirect_to(current_account) unless (current_account?(@account) || current_account.admin?)
            
    end

  def admin_account
      logger.debug "-----inside correct account---"
      redirect_to(current_account) unless current_account.admin?
  end