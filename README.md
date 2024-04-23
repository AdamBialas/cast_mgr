      ____          _   __  __            
     / ___|__ _ ___| |_|  \/  | __ _ _ __
    | |   / _` / __| __| |\/| |/ _` | '__|
    | |__| (_| \__ \ |_| |  | | (_| | |   
     \____\__,_|___/\__|_|  |_|\__, |_|   
       Copyright (C) Adibex    |___/    

# CastManager

Add Roles to Your Controller/Module/Job and validate_it on User.Rights.
The simplest way to do it :)

## Installation

Add this line to your application's Gemfile:

    gem 'cast_mgr'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cast_mgr

## Using in rails or without
Can store User rights in string as a list :

"R_Worker_admin,R_Worker_new,R_Worker_edit,R_Runner_admin"

just add a String field to User Model

Declare roles in model/controller/class

- simple Claas

```
class Worker
  include CastMgr::Roles
  extend CastMgr::Roles
  create_roles_group %i[new edit admin delete ]
 
```

- model

```
class Event < ApplicationRecord
  include ActiveModel::Validations
  include CastMgr::Roles
  extend CastMgr::Roles
  create_roles_group %i[ add_job build_raport ]

```

-controller
```
class EventsController < ApplicationController
  include CastMgr::Roles
  extend CastMgr::Roles
  create_roles_group %i[ create new delete edit ]

```

Validate user rights on code

```
def edit
return validate(current_user.user_rigths,:edit)
....
end

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

