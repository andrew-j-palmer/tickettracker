# TicketTracker - A project manager/ support ticket system with no fuss

This app was developed with Linux in mind. I'm not certain that Windows Users can install everything needed for this app. Mac Users should be ok.

* BEFORE STARTING 


Make sure you have something like
- Ruby 2.3.1
- Rails 5.1.4

I'm sure there is some room for error with versions here, but possibly not much. I've seen enough goofy issues with Ruby/Rails versions to know that this is probably the first place to look if trouble arises.

If you have those installed, navigate to your desired directory in command line, and type:

git clone https://github.com/andrew-j-palmer/tickettracker.git

(hopefully you have git)

and it should build the app for you. Once THAT'S done, it's time for...


* INSTALL 

There are a few non-standard Gems in use here. If we're lucky, all you have to do is stay in that same directory on command line and type

bundle install

and it prompts for password once or twice and then says everything went great. If it DOESN'T, I can help a little. Here's what we may need to do to get everything running.

*If it has trouble installing the bcrypt gem*

bcrypt handles password hashing for user accounts. We need this. I haven't heard of too many issues with the bcrypt gem, but if you do have trouble with it, try this:

sudo gem install bcrypt

If that doesn't work either, I would recommend finding the line in the Gemfile and take out the part that mentions specific version, and then try bundle install again. That's about all I could say. 

*If it has trouble with Paperclip or paperclip-cloudinary*

Paperclip is being used here to save screenshots to trouble tickets. It relies on ImageMagick to do this. If you get an error, you may not have ImageMagick installed. Alternatively, you may be able to rework the image processing using the paperclip-cloudinary gem, as cloudinary can do image transforms just like ImageMagick. If you want to install ImageMagick,

sudo apt-get install imagemagick

Kind of like bcrypt, I would try to do a gem install paperclip, and then try taking the version out of Gemfile but not sure what else to do. Sorry!


* DATABASE 

Database is MySQL. 
*If mysql2 gem doesn't install*

You may not have MySQL at all on your machine. try:

sudo apt-get install mysql-server

It could also be that you will need this as well:

sudo apt-get install libmysqlclient-dev

(I have used MySQL on my machine for years and I still needed this update to use the MySQL2 gem)

Unlike the default SQLite3, MySQL takes a little bit of setup before we can use it here. The database.yml included here has default values for database name and account, we just need to configure MySQL. First, we need to create an account that the app will use to access the database. To do that, we're going to log into MySQL with:

mysql -u root -p

If your MySQL install is brand new, the password it asks for should be the same as the root password on your computer. Once in, we want to enter

create user 'app'@'%' identified by 'Abcd1234@';

followed by

grant select, insert, update, delete, create, drop on app_development.* to 'app'@'localhost';

feel free to change username and password as well, but you may want to write it down. Change the secrets.yml to reflect your new username and password if you do.

AND OBVIOUSLY DON'T DEPLOY THIS ANYWHERE WITHOUT CHANGING THAT PASSWORD/USERNAME/DBNAME.

NOW, FINALLY, we can migrate our files.

rails db:migrate

I actually got an error the first time I tried this saying that such and such table already existed. I just re-ran migrate and it was fine. If for some reason it can't create the database at all, go back into MySQL and type

create database app_development;

then quit again, and try the migrate. As long as the db account the app uses is set up I don't think you'll have much trouble from here on out.


* ALL SET?

Sweet! Track some tickets!
