#Hobby_Site  

##1. What is it?  
This is a WebApp that helps users find other people with the same hobbies,
which are usually group activities. Ex. League of Legends, playing instruments,...
The goal is for other able to be able to form teams, bands, etc. for
activities that are much funner done in groups than individually.

##2. What technologies does it use?  
* Ruby on Rails  
* Bootstrap for front end styling  
* MySQL as the database  

##3. Setting up your dev environment

**TL:DR**  
1. in the terminal  
 `sh environment_setup.sh`
2. Setup the root user for MySQL (if not done already)
3. in the terminal  
`sh database_setup.sh`

###3.1 Prerequisites

####3.1.2 Mac OSX

First install the newest version of XCode via the Appstore  
**Make sure you actually run it after it downloads, or the installation process will be incomplete!!**

Then install the command line tools by running the following command in Terminal and then following the instructions  
`xcode-select --install`  

####3.1.3 Every OS

Download and install [Git] (https://git-scm.com/downloads).  

Clone this repo to a folder of your choice using the command  
`git clone https://github.com/tkomiya24/hobby_site.git`  
Or if you have your SSH key set up (Recommended, it'll save time in the end!)   
`git clone git@github.com:tkomiya24/hobby_site.git`

###3.2 Installation of software
Run the script 'environment_setup.sh' from the terminal.
**Note**: You will have to hit return to agree to [Homebrew] (http://brew.sh)
changing the permissions of some usr/loc folders, if Homebrew is not
already installed
`sh environment_setup.sh`

Next, secure your local instance of MySQL if you haven't already by setting a root user password. Type in the following commands into terminal and follow the prompts.  
```
mysql.server start  
mysqladmin -u root password
```

Next, run the database setup script. This will create the database, make the tables, and seed some values. You will be prompted for the MySQL root user password.  
`sh database_setup.sh`

##4. Running  
From the project directory, run the command
`rails s`  
Open up a browser and head to (http://localhost:3000/) [http://localhost:3000/]
