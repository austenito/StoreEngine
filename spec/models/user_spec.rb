require 'spec_helper'

describe User do
  let(:user) do
    User.new(email: "email@email.com",
             password: "password",
             password_confirmation: "password")
  end

  context "creating a user" do

    context "when it has an email, password" do

      context "the password is valid" do

        it "is valid" do

          expect(user).to be_valid
        end
      end

      context "the email is not unique" do
        let(:duplicate) do
          User.create!(email: "email@email.com",
                       password: "blah",
                       password_confirmation: "blah")
        end

        before do
          user.save!
        end

        it "is invalid" do
          pending "WHY IS THIS INVALID WHEN UNIQUENESS ATTRIBUTE ISN'T THERE?"
          puts User.count
          expect(duplicate).to be_invalid
        end
      end

      context "the password is less than 4 characters" do

        before do
          user.password = "123"
          user.password_confirmation = "123"
        end
        it "is invalid" do
          expect(user).to be_invalid
        end

        it "has errors" do
          expect(user).to have(1).errors_on(:password)
        end
      end

      context "the password doesn't match the confirmation" do

        let(:user) do
          User.new(email: "email@email.com",
                   password: "password",
                   password_confirmation: "pass")
        end

        it "is invalid" do
          expect(user).to be_invalid
        end

        it "has errors" do
          expect(user).to have(1).errors_on(:password)
        end
      end

    end

    context "when it is missing an email" do

      before do
        user.email = nil
      end

      it "is invalid" do
        expect(user).to be_invalid
      end

      it "has errors" do
        expect(user).to have(1).errors_on(:email)
      end
    end

    context "when it is missing a password" do
      before do
        user.password = nil
      end

      it "is invalid" do
        expect(user).to be_invalid
      end

      it "has errors" do
        expect(user).to have(3).errors_on(:password)
      end

    end
  end

  context "attribute thingies..." do
    context "user is an admin" do
      it "is an admin" do
        user.admin = true

        expect(user).to be_admin
      end
    end
  end
end
