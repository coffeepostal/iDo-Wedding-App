namespace 'ido' do
  desc "Creates an admin user."
  task :admin => :environment do
    begin
      puts "Enter the name of the admin user (e.g. John Smith):"
      name = $stdin.gets.chomp
      a = Guest.create(:name => name)
      a.admin = true
    end until a.save
    msg = %(Admin user successfully created. You may now log in using PIN "#{a.reload.pin}" and last name "#{a.last_name}".)
    puts msg
  end
end