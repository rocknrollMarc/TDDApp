require "spec_helper"

describe Contact do 
	it "has a valid factory" do
		FactoryGirl.create(:contact).should be_valid
		## FactoryGirl.create works like Model.create. It saves the object to the DB
	end
	it "is invalid without a firstname" do
		FactoryGirl.build(:contact, firstname: nil).should_not be_valid
		## Using FactoryGirl.build instead of create. This wont save object to 
		## DB just like Model.build
		## Passing a firstname: will override default Contact Factories firstname attribute
		## which is generated through 'faker'
	end
	it "is invalid without a lastname" do
		FactoryGirl.build(:contact, lastname: nil).should_not be_valid
	end
	it "returns a contact's full name as a string" do
		contact = FactoryGirl.create(:contact, firstname: 'Vishal', lastname: 'Mujumdar')
		contact.name.should == 'Vishal Mujumdar'
	end

	it "returns an array of results that match" do
		john = FactoryGirl.create(:contact, lastname: 'John')
		smith = FactoryGirl.create(:contact, lastname: 'Smith')
		jaden = FactoryGirl.create(:contact, lastname: 'Jaden')

		expect(Contact.filter_by_name("J")).to include john,jaden
	end
end