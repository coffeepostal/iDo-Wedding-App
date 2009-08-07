namespace 'git' do
  desc 'Fixes \r characters in script files.'
  task :fix_scripts => :environment do
    files = Dir[Rails.root.join('script', '*')]
    files.map do |file|
      File.directory?(file) ? Dir[File.join(file, '*')] : file
    end.flatten.each do |file|
      File.open(file, 'w') do |f|
        f.write File.read(file).gsub('\r', '')
      end
    end
  end
end