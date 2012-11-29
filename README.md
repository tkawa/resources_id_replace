# resources_id_replace

Replace param name of resources' id.
Useful for making user friendly URL.

## Example

You can use `:replace_id_with` option for `resources`.

```ruby
resources :users, :replace_id_with => 'name'
```

```
    users GET    /users(.:format)            users#index
          POST   /users(.:format)            users#create
 new_user GET    /users/new(.:format)        users#new
edit_user GET    /users/:name/edit(.:format) users#edit
     user GET    /users/:name(.:format)      users#show
          PUT    /users/:name(.:format)      users#update
          DELETE /users/:name(.:format)      users#destroy
```

Good with the following codes.

```ruby
class User < ActiveRecord::Base
  def to_param
    name
  end
end
```

```ruby
class UsersController < ApplicationController
  def show
    @user = User.find_by_name!(params[:name])
  end
end
```


## Installation

Add this line to your application's Gemfile:

    gem 'resources_id_replace'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resources_id_replace

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
