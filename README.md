# Moxi UTWS
A bathroom sink Docker-Containerized Rails setup.

**Rails Setup Command**
`rails new moxi-utws -T`

**Stack**
- Ruby 3.2.1
- Rails 7.0.4
- sqlite
- Stimulus/Turbo
- RSpec/FactoryBot

**Docker Implementation:** [rails/docked](https://github.com/rails/docked)

## Setup
```
d/setup
```
*(yes, that simple)*

## Commands

### `d/rails`
Rails command `d/rails s`, `d/rails db:migrate`, ...
### `d/bundle`
Bundle command `d/bundle install`, `d/bundle config`, ...
### `d/rspec`
Rspec command `d/rspec spec`
### `d/run`
Run any shell command in the container 
### `d/shell`
Access the container's bash shell environment

***Note:** all `d/` commands will reset the owner of the application files from the docker container root. This sporadically causes a sudo root access request* `[sudo] password for user:`


