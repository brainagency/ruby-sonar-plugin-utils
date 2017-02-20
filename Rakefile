desc "Runs default task, which is `test`"
task default: %w[test]

desc "Runs tests"
task :test do
  files = FileList['test/**/*_test.rb']
  files_paths_joined = files.join(" ")
  ruby "-Itest #{files_paths_joined}"
end
