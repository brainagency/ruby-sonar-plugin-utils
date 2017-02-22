# ruby-sonar-plugin-utils

Contains a bunch of utility scripts to perform some file conversions and other preparation stuffs
for original plugin.

## Requirements

All scripts are pure Ruby scripts, so to be able to run provided scripts on your local machine you need:

1. Have installed Ruby. The `rvm` is a good choice to do it!
2. Install `bundler` gem by `gem install bundler`
3. Install dependencies by running `bundle install`

## Utility scripts

### Convert rubocop rules into SonarQube profile rules

__Command specification:__

```shell
$ ./rubocop_rules_to_profile.rb -i <INPUT_FILE_PATH> -o <OUTPUT_FILE_PATH>
```

Converts an YAML file with Rubocop rules into XML file of SonarQube profile rules.

__Details__

_Example of Rubocop rules file:_

```yaml
Style/AccessModifierIndentation:
  Description: Check indentation of private/protected visibility modifiers.
  StyleGuide: '#indent-public-private-protected'
  Enabled: true
```

_Example of SQ profile rule definition part:_

```xml
<rule>
  <repositoryKey>rubocop</repositoryKey>
  <key>Style/AccessModifierIndentation</key>
  <priority>MINOR</priority>   
</rule>
```

_Default severity level mapping depending on the Rubocop's rule key:_

```ruby
KEY_PREFIX_MAPPING_TO_PRIORITY = {
  /^Style/       => SonarQube::RulePriorities::MINOR,
  /^Metrics/     => SonarQube::RulePriorities::INFO,
  /^Lint/        => SonarQube::RulePriorities::MINOR,
  /^Bundler/     => SonarQube::RulePriorities::INFO,
  /^Performance/ => SonarQube::RulePriorities::MINOR,
  /^Rails/       => SonarQube::RulePriorities::MINOR,
  /^Security/    => SonarQube::RulePriorities::CRITICAL
}
```

## Developing

### Testing

All scripts are fully tested by unit tests. For running tests, please, use the following command:

```shell
$ bundle exec rake
```
