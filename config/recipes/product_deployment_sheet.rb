namespace :product_deployment_sheet do
  desc 'Test task for spreadsheet'
  task :update => :environment do
    status_row = [
        fetch(:host_ip),
        fetch(:rails_env),
        Time.now.to_s.gsub(' ', '@'),
        `git config user.name`.chomp.gsub(' ', '@'),
        fetch(:branch),
        `git log --format="%H" -1 -b #{fetch(:branch)}`.chomp
    ]

    invoke :'rvm:use', "ruby-#{fetch(:ruby_version)}@#{fetch(:gemset)}"

    rake_task_str = "cd #{fetch(:current_path)} && bundle exec rake deployment_sheet:update['#{status_row.join(' ').to_s}','#{fetch(:sheet_name)}','#{fetch(:work_sheet_name)}'] RAILS_ENV=#{fetch(:rails_env)}"
    command rake_task_str
  end
end