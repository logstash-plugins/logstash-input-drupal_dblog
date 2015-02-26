Gem::Specification.new do |s|

  s.name            = 'logstash-input-drupal_dblog'
  s.version         = '0.1.4'
  s.licenses        = ['Apache License (2.0)']
  s.summary         = "Retrieve watchdog log events from a Drupal installation with DBLog enabled"
  s.description     = "This gem is a logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/plugin install gemname. This gem is not a stand-alone program"
  s.authors         = ["Elasticsearch"]
  s.email           = 'info@elasticsearch.com'
  s.homepage        = "http://www.elasticsearch.org/guide/en/logstash/current/index.html"
  s.require_paths = ["lib"]

  # Files
  s.files = `git ls-files`.split($\)+::Dir.glob('vendor/*')

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "input" }

  # Jar dependencies
  s.requirements << "jar 'mysql:mysql-connector-java', '5.1.33'"

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", '>= 1.4.0', '< 2.0.0'

  # Currently there is a blocking issue with the latest (3.1.1.0.9) version of 
  # `ruby-maven` # and installing jars dependencies. If you are declaring a gem 
  # in a gemfile # using the :github option it will make the bundle install crash,
  # before upgrading this gem you need to test the version with any plugins
  # that require jars.
  #
  # Ticket: https://github.com/elasticsearch/logstash/issues/2595
  s.add_runtime_dependency 'jar-dependencies', '0.1.7'
  s.add_runtime_dependency 'ruby-maven', '3.1.1.0.8'
  s.add_runtime_dependency "maven-tools", '1.0.7'

  s.add_runtime_dependency 'logstash-codec-plain'
  s.add_runtime_dependency 'php_serialize'

  if RUBY_PLATFORM == 'java'
    s.platform = RUBY_PLATFORM
    s.add_runtime_dependency 'jdbc-mysql'
  else
    s.add_runtime_dependency 'mysql2'
  end

  s.add_development_dependency 'logstash-devutils'
end

