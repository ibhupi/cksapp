# Requirements
- Ruby 2.3.1
- Rails 4.2.6
- MySQL 5.6
- gem rails-api, mysql2

# Steps to build app
## Clone app
```
$ git clone git@github.com:ibhupi/cksapp.git
$ cd cksapp/backend/api
$ bundle install
```

## Database setting
```
# config/database.yml
development:
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: XXXXX
  pool: 5
  username: XXXXX
  password: XXXXX
  socket: /var/lib/mysql/mysql.sock
  host: XXXXXXXX.rds.aliyuncs.com
```

### Server Application Run
```
$ rails s -b 0.0.0.0
```
