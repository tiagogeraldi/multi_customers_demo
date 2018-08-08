Multiple Tenants Without Subdomain
================

[Apartment](https://github.com/influitive/apartment) is a nice gem to have multi customers by domain, subdomain or host. You can separate different customers data at the DB level for each one access a total different area.

The most common use for Apartment is have a different subdomain for each customer example: 'http://new-customer.your-domain.com'. However, on this example, we don't want that.

We prefer to have a first screen where user must inform the customer name, then, go to the regular login page by Devise.

Check this out live at: https://tenant-without-subdomain.herokuapp.com

Ruby on Rails
-------------

This application requires:

- Ruby 2.4.2
- Rails 5.2.0

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

mv config/database.yml.example config/database.yml
# check your DB settings

bundle exec rake db:create db:migrate db:seed

Running
---------------
bundle exec rails s

Go to http://localhost:3000


Testing
-----------

bundle exec rspec
