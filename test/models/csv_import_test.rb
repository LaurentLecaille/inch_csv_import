require 'test_helper'

class CsvImportTest < ActiveSupport::TestCase


  test 'Should not update any attributes' do
    person = Person.find_by(reference: 1)
    hash = {'reference': 1, 'email': 'test_1@test.com', 'home_phone_number': '0000000', 'mobile_phone_number': '1111111', 'firstname': 'Clark', 'lastname': 'Kent', 'address': 'Metropolis'}
    CsvImport.update_attribues(person, hash, Person::PERSON_UPDATABLE_ATTRIBUTES)
    assert_equal person, Person.find_by(reference: 1)
  end

  test 'Should update attributes' do
    person = Person.find_by(reference: 1)
    frozen_person = person.dup.freeze
    hash = {'reference': 1, 'email': 'test_2@test.com', 'home_phone_number': '2222222', 'mobile_phone_number': '3333333', 'firstname': 'Clark', 'lastname': 'Kent', 'address': 'Gotham City'}
    CsvImport.update_attribues(person, hash, Person::PERSON_UPDATABLE_ATTRIBUTES)
    assert_not_equal frozen_person, person
  end

  test 'Should update email' do
    person = Person.find_by(reference: 1)
    frozen_person = person.dup.freeze
    hash = {'reference': 1, 'email': 'test_2@test.com', 'home_phone_number': '0000000', 'mobile_phone_number': '1111111', 'firstname': 'Clark', 'lastname': 'Kent', 'address': 'Metropolis'}
    CsvImport.update_attribues(person, hash, Person::PERSON_UPDATABLE_ATTRIBUTES)
    assert_not_equal frozen_person.email, person.email
  end

  test 'Should update home_phone_number' do
    person = Person.find_by(reference: 1)
    frozen_person = person.dup.freeze
    hash = {'reference': 1, 'email': 'test_1@test.com', 'home_phone_number': '2222222', 'mobile_phone_number': '1111111', 'firstname': 'Clark', 'lastname': 'Kent', 'address': 'Metropolis'}
    CsvImport.update_attribues(person, hash, Person::PERSON_UPDATABLE_ATTRIBUTES)
    assert_not_equal frozen_person.home_phone_number, person.home_phone_number
  end

  test 'Should update mobile_phone_number' do
    person = Person.find_by(reference: 1)
    frozen_person = person.dup.freeze
    hash = {'reference': 1, 'email': 'test_1@test.com', 'home_phone_number': '0000000', 'mobile_phone_number': '3333333', 'firstname': 'Clark', 'lastname': 'Kent', 'address': 'Metropolis'}
    CsvImport.update_attribues(person, hash, Person::PERSON_UPDATABLE_ATTRIBUTES)
    assert_not_equal frozen_person.mobile_phone_number, person.mobile_phone_number
  end

  test 'Should update address' do
    person = Person.find_by(reference: 1)
    frozen_person = person.dup.freeze
    hash = {'reference': 1, 'email': 'test_1@test.com', 'home_phone_number': '0000000', 'mobile_phone_number': '1111111', 'firstname': 'Clark', 'lastname': 'Kent', 'address': 'Gotham City'}
    CsvImport.update_attribues(person, hash, Person::PERSON_UPDATABLE_ATTRIBUTES)
    assert_not_equal frozen_person.address, person.address
  end

  test 'Updatable person attributes should be' do
    updatable_attributes = ['email','home_phone_number', 'mobile_phone_number', 'address']
    assert_equal updatable_attributes, Person::PERSON_UPDATABLE_ATTRIBUTES
  end

  test 'Updatable building attributes should be' do
    updatable_attributes = ['email','home_phone_number', 'mobile_phone_number', 'address']
    assert_equal updatable_attributes, Person::PERSON_UPDATABLE_ATTRIBUTES
  end
end
