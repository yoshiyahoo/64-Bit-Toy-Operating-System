# #!C:\Users\josia\scoop\shims\nu.exe (I don't think we need this inside of windows)
# Use source script.nu to ensure state transfers over
let image_name = "toyos:dev"

# If we change the image, rebuild it
let check_exist = docker inspect $image_name | complete
if $check_exist.exit_code == 1 {
	docker build -t toyos:dev .
}

# Ensure your X-server is running on port 6000
# The server should run on localhost
# The spaces are to ensure we only match on exactly port 6000
# netstat -n | find -r " 127.0.0.1:6000 " | is-empty
if (netstat -n | find -r " 127.0.0.1:6000 " | is-empty) {
	print "Starting X-server"
	xlaunch
}

# Ensure the DISPLAY environment variable is set
if not ("DISPLAY" in $env) {
	# Save IP data to a file for grep to see it better
	ipconfig | save -f file.txt

	# Read the file and grab the first IP address
	# From testing, 39 is the index where the IP's start,
	let iplist = grep "IPv4 Address" file.txt | split row "\r\n" | str substring 39..

	# Make sure the display variable matches the format [here](https://linuxvox.com/blog/linux-display-environment-variable/#fundamental-concepts-of-linux-display-environment-variables)
	$env.DISPLAY = $iplist.0 + ":0.0" # this is the default display
	print $"Set DISPLAY={($env.DISPLAY)}"
	# Clean up the dummy file
	rm file.txt
}

# Make sure you're running this script in the git repo.
# Make sure that before the name of the image you set all relevant information
# --net=host is a little scary, it makes programs running on the container look like they're running on the host machine
# source: [here](https://stackoverflow.com/questions/43316376/what-does-network-host-option-in-docker-command-really-do)
docker run -it --rm -v $"($env.PWD):/os-workspace" --env DISPLAY=($env.DISPLAY) -p 1234:1234 toyos:dev
