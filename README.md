# sparta UI testing

## Introduction
This set of work involves looking into automating data on a website also grabbing it and using it alongside rspec . Within this repo you will find examples of array, hash and json data usage and manipulation.

## Getting started
Simply clone the repository to your computer to get started with this rspec introduction. The rspec gem should be included with base Ruby. Checkout the rspec documentation to brush up on general use of rspec.

## Prerequisites
This was done in Ruby 2.4.0 older versions may not be compatible. see here for instructions on updating your Ruby version (on Mac) Also you need selenium installed on your machine.

## Running Tests
In general run the following command in your terminal to get the results of your rspec tests.

```
rspec file_name.rb
```
Or if you just want to automate data without rspec just type this command
```
ruby file_name.rb
```
Built With
Ruby and rspec and selenium!

------

## Capybara

Automation test built using Capybara to test login/registration process of bbc.co.uk.<br>
Tests are explained here below using the Gherking syntax:given, when, then.

### Test journeys throughout the test

**Test journey 1**<br>
GIVEN that the user is on login page<br>
WHEN user wants to login with incorrect details <br>
THEN the system should respond with the correct error<br>

**Test journey 2**<br>
GIVEN that the user is on login page<br>
WHEN user wants to login with no details are entered<br>
THEN the system should respond with the correct error<br>

**Test journey 3**<br>
GIVEN that the user is on login page<br>
WHEN user wants to login with a username anda  password that are both too short(less than 2 characters)<br>
THEN the system should respond with the correct error<br>

**Test journey 4**<br>
GIVEN that the user is on registration page<br>
WHEN user someone under 13 yrs tries to register with missing/incorrect details<br>
THEN the system should respond with the correct error<br>

**Test journey 5**<br>
GIVEN that the user is on registration page<br>
WHEN user someone under 13 yrs tries to register with correct details<br>
THEN the system should successfully go through the registration process

**Test journey 6**<br>
GIVEN that the user is on registration page<br>
WHEN user someone above 13 yrs tries to register with missing/incorrect details<br>
THEN the system should respond with the correct error<br>

**Test journey 7**<br>
GIVEN that the user is on registration page<br>
WHEN user someone above 13 yrs tries to register with correct details<br>
THEN the system should successfully go through the registration process<br>
