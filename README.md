# README

# Setup

## Initialization

Create a new Rails project:

```
rails new ordoo --database=postgresql
```

## `An error occurred while installing ffi (1.9.21), and Bundler cannot continue.`

This is a workaround. Add the following to `Gemfile`:

```
gem 'ffi', '1.9.18'
```

Then run:

```
bundle install
```

## Create `.gitignore` before pushing to remote repository

Update `.gitignore` to push only necessary files to Github.

<!--
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
-->
