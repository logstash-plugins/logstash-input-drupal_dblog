require "logstash/devutils/rspec/spec_helper"
require "logstash/devutils/rspec/shared_examples"
require "logstash/inputs/drupal_dblog"

describe LogStash::Inputs::DrupalDblog do
  it_behaves_like "an interruptible input plugin" do
    let(:config) { { "databases" => {} } }
  end
end
