namespace :quality do
  begin
    require 'rubocop/rake_task'
    desc 'Run RuboCop on the lib directory'
    RuboCop::RakeTask.new(:rubocop) do |task|
      task.patterns = ['app/**/*.rb', 'config/**/*.rb', 'lib/**/*.rb']
    end
  rescue LoadError
    puts '>>>>> Rubocop gem not loaded, omitting tasks'
  end

  begin
    require 'reek/rake/task'
    desc 'Run reek to examines classes, modules and methods and report any' \
         'code smells'
    Reek::Rake::Task.new do |t|
      t.fail_on_error = false
    end
  rescue LoadError
    puts '>>>>> Reek gem not loaded, omitting tasks'
  end

  begin
    require 'cane/rake_task'
    desc 'Run cane to check quality metrics'
    Cane::RakeTask.new(:cane) do |cane|
      cane.abc_max = 10
      # cane.add_threshold 'coverage/covered_percent', :>=, 99
      cane.no_style = true
    end
  rescue LoadError
    puts '>>>>> Cane gem not loaded, omitting tasks'
  end

  task all: [:rubocop, :cane]
end
