class AccountsController < ApplicationController

  include SessionsHelper
  
  before_filter :signed_in_account, only: [:edit, :update]
  before_filter :correct_account,   only: [:edit, :update, :show]
  before_filter :admin_account,     only: [:index]
  
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
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
    3.times { @account.workers.build}


  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])
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
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
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
      @account = Account.find(params[:id])
      if !(current_account?(@account) || current_account.admin?)
        redirect_to(current_account)
      end
      
    end

  def admin_account
      redirect_to(current_account) unless current_account.admin?
  end