#Hobby Site  

##1. What is it?  
This is a WebApp that helps users find other people with the same hobbies,
which are usually group activities. Ex. League of Legends, playing instruments,...
The goal is for other able to be able to form teams, bands, etc. for
activities that are much funner done in groups than individually.

##2. What technologies does it use?  
* Ruby on Rails  
* Bootstrap for front end styling  
* MySQL as the database  

* For precommits we are using NodeJS and the pre-commit package.

##3. Setting up your dev environment

###3.1 Prerequisites

1. NodeJS*
2. Ruby 2.2.3
3. MySQL 5
4. Bundler (a Ruby gem)

  \*Required only for pre-commit hooks, not for the app

####3.1.1 Mac OSX

First install the newest version of XCode via the Appstore  
**Make sure you actually run it after it downloads, or the installation process will be incomplete!!**

Then install the command line tools by running the following command in Terminal and then following the instructions  
`xcode-select --install`  

###3.2 Installation

1. Once all prerequisites have been installed:
  * `npm install`
  * `bundle install`

###3.3 Database setup
1. Create 2 databases and give all permissions to them to user 'hobby_site' with password 'password'
  * hobby_site_development and hobby_site_test
2. Run `rake db:schema:load`
3. You can seed with `rake db:seed`

##4. Running  
Make sure MySQL has been started  
`mysql.server start`  
From the project directory, run the command  
`rails s`  
Open up a browser and head to [http://localhost:3000/] (http://localhost:3000/)
