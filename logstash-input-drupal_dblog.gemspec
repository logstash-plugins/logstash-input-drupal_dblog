Gem::Specification.new do |s|

  s.name            = 'logstash-input-drupal_dblog'
  s.version         = '0.1.0'
  s.licenses        = ['Apache License (2.0)']
  s.summary         = "Retrieve watchdog log events from a Drupal installation with DBLog enabled"
  s.description     = "Retrieve watchdog log events from a Drupal installation with DBLog enabled"
  s.authors         = ["Elasticsearch"]
  s.email           = 'richard.pijnenburg@elasticsearch.com'
  s.homepage        = "http://logstash.net/"
  s.require_paths = ["lib"]

  # Files
  s.files = `git ls-files`.split($\)+::Dir.glob('vendor/*')

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "group" => "input" }

  # Jar dependencies
  s.requirements << "jar 'mysql:mysql-connector-java', '5.1.33'"

  # Gem dependencies
  s.add_runtime_dependency 'logstash', '>= 1.4.0', '< 2.0.0'
  s.add_runtime_dependency 'jar-dependencies', ['~> 0.0.6']

  s.add_runtime_dependency 'logstash-codec-plain'
  s.add_runtime_dependency 'php_serialize'

  if RUBY_PLATFORM == 'java'
    s.add_runtime_dependency 'jdbc-mysql'
  else
    s.add_runtime_dependency 'mysql2'
  end

end

