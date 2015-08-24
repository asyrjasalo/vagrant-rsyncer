# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rsyncer/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-rsyncer"
  spec.version       = VagrantPlugins::Rsyncer::VERSION
  spec.authors       = ["Anssi Syrjäsalo"]
  spec.email         = ["anssi.syrjasalo@gmail.com"]

  spec.summary       = %q{Vagrant continuous file syncer plugin.}
  spec.description   = %q{Uses filesystem events and rsync. Works on GNU/Linux, OS X and Windows.}
  spec.homepage      = "https://github.com/asyrjasalo/vagrant-rsyncer"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
