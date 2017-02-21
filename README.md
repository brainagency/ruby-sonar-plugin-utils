# ruby-sonar-plugin-utils

Contains a bunch of utility scripts to perform some file conversions and other preparation stuffs
for original plugin.

## Convert rubocop rules into SonarQube profile rules

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
  /^Style/       => RulePriorities::MINOR,
  /^Metrics/     => RulePriorities::INFO,
  /^Lint/        => RulePriorities::MINOR,
  /^Bundler/     => RulePriorities::INFO,
  /^Performance/ => RulePriorities::MINOR,
  /^Rails/       => RulePriorities::MINOR,
  /^Security/    => RulePriorities::CRITICAL
}
```
