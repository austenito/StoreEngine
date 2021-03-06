require 'spec_helper'

describe User do
  let(:user) do
    User.new(first_name: "afirstname",
             last_name: "alastname",
             email: "email@email.com",
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
          User.create!(first_name: "afirstname",
                       last_name: "alastname",
                       email: "email@email.com",
                       password: "blah",
                       password_confirmation: "blah")
        end

        before do
          user.save!
        end

        it "is invalid" do
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
        expect(user).to have(2).errors_on(:email)
      end
    end

    context "when the email is not of a valid type" do

      before do
        user.email = "invalidemail"
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

  context "a user can have an optional display name" do

    let(:user) do
      User.new(first_name: "afirstname",
                   last_name: "alastname",
                   email: "email@email.com",
                   password: "blah",
                   password_confirmation: "blah" )
    end

    it "returns that display name if it is present" do
      user.display_name = "j3"
      user.save
      expect(User.find_by_id(user.id).display_name).to eq "j3"
    end

    it "is invalid if that display name is shorter tha 2 characters" do
      user.display_name = "j"
      user.save
      expect(user).to be_invalid
      expect(user).to have(1).errors_on(:display_name)
    end

    it "is invalid if that display name is longer than 32 characters" do
      user.display_name = "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj"
      user.save
      expect(user).to be_invalid
      expect(user).to have(1).errors_on(:display_name)
    end
  end

  context "a user does not enter a first name" do
    before do
      user.first_name = nil
    end

    it "is invalid" do
      expect(user).to be_invalid
    end

    it "has errors" do
      expect(user).to have(1).errors_on :first_name
    end
  end

  context "a user does not enter a last name" do
    before do
      user.last_name = nil
    end

    it "is invalid" do
      expect(user).to be_invalid
    end

    it "has errors" do
      expect(user).to have(1).errors_on :last_name
    end
  end

  context "attribute thingies..." do
    context "user is an admin" do
      it "is an admin" do
        user.admin = true
        user.save
        expect(user).to be_admin
      end
    end
  end

  context "a user's information can be updated" do
    it "doesn't care about passwords" do
      user.save
      found_user = User.find_by_id(user.id)
      new_attributes = {first_name: "elaine",
        last_name: "alastname",
        email: "email@email.com"}
      found_user.update_attributes(new_attributes)
      expect(found_user.errors).to be_empty

    end
  end
end
