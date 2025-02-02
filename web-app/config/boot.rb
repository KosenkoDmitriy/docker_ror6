ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'logger' # fix $ rake db:migrate (NameError: uninitialized constant ActiveSupport::LoggerThreadSafeLevel::Logger)
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
