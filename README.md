# grafana2


## Description
http://grafana.org

Brand new cookbook for the new Grafana 2.0 release. See:
http://grafana.org/blog/2015/04/20/Grafana-2-Released.html

We used RDS/MySQL for data and sessions. Will add options for other setups soon.

Manually create a MySQL RDS instance and update attributes/default.rb
Manually create the sessions table in mysql:
yum install mysql

```
CREATE TABLE `session` (
    `key`       CHAR(16) NOT NULL,
    `data`      BLOB,
    `expiry`    INT(11) UNSIGNED NOT NULL,
    PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
```
...

## Usage

You must change the attributes for domain and database host, user, password.

Add 'recipe[grafana2::default]' to your node's run-list.

To use this cookbook in another recipe, add a dependency on it to your
cookbook's metadata.rb:

    depends 'grafana2', '~> 0.0'

Then include it in one of your recipes:

    include_recipe 'grafana2::default'

(the ~> syntax will pull in the latest version in the 0.x series but
not any version in 1.x.  As the cookbook you depend on is updated, you
will have to change this to '~> 1.0' as appropriate.)

## Recipes

### default

The default recipe will call install, config, and service definitions.

## Attributes

The attributes defined by this recipe are organized under the
`node['grafana2']` namespace.

Attribute | Description | Type   | Default
----------|-------------|--------|--------
domain    | Used in setting root URL | String | 
db_host | IP or hostname for database | String |

## LWRP

## Development

The first time you check out this cookbook, run

    bundle --binstubs

to download and install the development tools.

## Testing

Three forms of cookbook testing are available:

### Style Checks

    bin/rake style

Will run foodcritic (cookbook style) and tailor (ruby style/syntax)
checks. These tests must pass before the cookbook can progress
through the CI pipeline.

### Unit Tests

    bin/rake spec

Will run ChefSpec tests.  It is a good idea to ensure that these
tests pass before committing changes to git.

#### Unit Test Coverage

    bin/rake coverage

Will run the ChefSpec tests and report on test coverage.  It is a
good idea to make sure that every Chef resource you declare is covered
by a unit test.

#### Automated Testing with Guard

    bin/guard

Will run foodcritic, tailor, rubocop (if enabled) and chefspec tests
automatically when the associated files change.  If a chefspec test
fails, it will drop you into a pry session in the context of the
failure to explore the state of the run.

To disable the pry-rescue behavior, define the environment variable
DISABLE_PRY_RESCUE before running guard:

    DISABLE_PRY_RESCUE=1 bin/guard

### Integration Tests

    bin/rake kitchen:all

Will run the test kitchen integration tests.  These tests use Vagrant
and Virtualbox, which must be installed for the tests to execute.

These are only available for cookbooks that target Unix-like systems.
Support for Windows targets is expected by the end of 2014.

By default, these tests run against Centos 6.6 and Ubuntu 12.04 images, but
this can be changed in the file .kitchen.yml.

After converging in a virtual machine, ServerSpec tests are executed.
This skeleton comes with a very basic ServerSpec test; refer to
http://serverspec.org for detail on how to create tests.

## Using Berkshelf for dependencies

In order for Berkshelf to access both the public supermarket and
the Nordstrom private supermarket, we need to use a forked copy of
the berkshelf and berkshelf-api-client gems.

To ensure that you use the forked versions rather than the ones that
come with ChefDK, ensure that you always run

    bundle exec berks install

rather than just

    berks install

## Customization

Certain files are overwritten when the cookbook generator is run on top
of an existing cookbook, including

* Gemfile
* Berksfile
* Rakefile
* Guardfile

To add local customizations to these files, place them in separate files
in subdirectories of lib, as described below:

### Rakefile

Put each local task in a file with an extension of .rake in the lib/tasks
directory (e.g. lib/tasks/mything.rake):

    task :mything do
      puts 'I did something!'
    end

### Gemfile

Put each local snippet in a file with an extension of .bundler in the lib/gemfile
directory (.e.g lib/gemfile/myoverride.bundler)

   gem 'pry-byebug'

### Berksfile

Put each local snippet in a file with an extension of .berks in the lib/berksfile
directory (.e.g lib/berksfile/myoverride.berks)

   gem 'pry-byebug'

### Guardfile

Put each local snippet in a file with an extension of .guard in the lib/guardfile
directory (.e.g lib/guardfile/myoverride.berks)

```
  guard :rake, task: :coverage do
    watch(%r{^spec/foo/.+_spec\.rb$})
    watch(%r{^spec/spec_helper\.rb$})
    watch(%r{^attributes/.+\.rb$})
    watch(%r{^resources/.+\.rb$})
    watch(%r{^providers/.+\.rb$})
    watch(%r{^libraries/.+\.rb$})
    watch(%r{^recipes/.+\.rb$})
    watch(%r{^metadata\.rb$})
  end
```

## Author

Nordstrom, Inc.

## License

- Copyright (c) 2015 Nordstrom, Inc.

License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Template Version

Originally created from Nordstrom Cookbook Template v0.16.2
