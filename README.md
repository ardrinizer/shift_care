## Setup

### Confirm if Ruby is installed
```
ruby -v
```
### Install bundler
```
gem install bundler
```
### Install gems
```
bundle install
```

## Commands to use
### Search
```
ruby main.rb search <keyword>
ruby main.rb search lia
```

### Duplicate
```
ruby main.rb duplicate 
```

## For RSpec testing
### Testing commands
```
rspec
rspec spec/main_spec.rb
rspec spec/client_loader_spec.rb
rspec spec/client_search_spec.rb
rspec spec/client_duplicate_spec.rb
```

***Notes:*** *I added a ```puts``` on every returns for printing. But I also return the actual values for testing.*

## Limitations

### Overall
- There can be a performance issue since we are loading the file entirely then doing the filtering based on that.
- Results are unsorted and will be returned without a limit.

### Search functionality
- Since we are only using ```.select```, the search is limited to simple filtering, unlike the advanced querying features offered by ```Searchkick``` or ```PgSearch```.
- Limited filtering to specific key which is ```full_name```.

### Duplicate Functionality
- Filtering for duplicate emails is case-sensitive, so similar emails with different letter cases are treated as different.
