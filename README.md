# SocialZ
https://socialzeta.herokuapp.com/

`SocialZ` is a open source social network built in Ruby on Rails.

##### In this platform users can:
* upload posts with photos, then edit or destry them.
* The posts are votable and commentable by the other users.
* destroy comments
* See all the other user's posts and profiles
* Edit user data

##### Ruby version: 
* 2.5.1

##### Rails version: 
* 5.2.1

##### Database: 
* Postgresql

##### Dasabate setup: 
1) install postgresql in your system
2) create a new user
3) give the superuser permission to the new user
5) move to the config dir
```sh
$ cd config
```
4) open the `database.yml` file
5) edit the file
```sh
default: &default
  adapter: postgresql
  encoding: unicode
  username: "YOUR POSTGRESQL USER_NAME"
  password: "YOUR POSTGRESQL USER_PASSWORD"
  ...
  ```

##### Database creation: 
write the terminal command inside the porject directory:
```sh
$ rake db:setup
```

##### Database initialization: 
and create the tables
```sh
$ rake db:migrate
```

##### Run the project in local:
write the terminal command inside the porject directory:
```sh
$ bin/rails s
```

##### Technical details: 
* SocialZ use the rails active storage to store the images
* The comment are created and deleted by using AJAX
* AJAX is used also when you like or delete the posts from your `profile` or from the `home`.
* the app is stored in heroku with a hobby-dev plan, so it won't store the active storage like images more then 30 minutes.

##### Some screenshots...
![screenshot from 2018-08-30 15-34-16](https://user-images.githubusercontent.com/31965653/44855303-07f86e80-ac6b-11e8-857b-10551599d9f1.png)
![screenshot from 2018-08-30 15-35-15](https://user-images.githubusercontent.com/31965653/44855304-07f86e80-ac6b-11e8-8cee-028b3cdbea76.png)
![screenshot from 2018-08-30 15-37-04](https://user-images.githubusercontent.com/31965653/44855305-08910500-ac6b-11e8-8c96-6d2a08d560d7.png)
![screenshot from 2018-08-30 15-38-29](https://user-images.githubusercontent.com/31965653/44855306-08910500-ac6b-11e8-8e29-c4735fdf30cb.png)