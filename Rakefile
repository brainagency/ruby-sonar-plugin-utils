desc "Runs default task, which is `test`"
task default: %w[test]

desc "Runs tests"
task :test do
  $LOAD_PATH << 'test'
  Dir.glob('./test/**/*_test.rb').each { |file| require file}
end
