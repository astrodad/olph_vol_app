require 'spec_helper'

describe Account do
  
	before do
		@account = Account.new(name: "The Plumey Family", email: "javierplumey@gmail.com",
			password: "testtest", password_confirmation: "testtest", year: "2012-2013", admin: false)
	end

	subject {@account}

	it {should respond_to(:name)}
	it {should respond_to(:year)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
	it {should respond_to(:remember_token)}

	it {should be_valid}
	it {should_not be_admin}

	describe "with admin rights to set 'true'" do
		before {@account.toggle!(:admin)}

		it {should be_admin}
	end

describe "when name is not present" do
    before { @account.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @account.email = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @account.name = "a" * 51}
  	it { should_not be_valid}
  end

describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[account@foo,com account_at_foo.org example.account@foo.]
      addresses.each do |invalid_address|
        @account.email = invalid_address
        @account.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com A_USER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @account.email = valid_address
        @account.should be_valid
      end      
    end
  end

  describe "when email address is already taken" do
    before do
      account_with_same_email = @account.dup
      account_with_same_email.save
    end

    it { should_not be_valid }
  end

describe "when email address is already taken" do
    before do
      account_with_same_email = @account.dup
      account_with_same_email.email = @account.email.upcase
      account_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @account.password = @account.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @account.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @account.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @account.save }
    let(:found_account) { Account.find_by_email(@account.email) }

    describe "with valid password" do
      it { should == found_account.authenticate(@account.password) }
    end

    describe "with invalid password" do
      let(:account_for_invalid_password) { found_account.authenticate("invalid") }

      it { should_not == account_for_invalid_password }
      specify { account_for_invalid_password.should be_false }
    end
  end

  describe "with a password that's too short" do
    before { @account.password = @account.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "remember token" do
    before { @account.save }
    its(:remember_token) { should_not be_blank }
  end

end
