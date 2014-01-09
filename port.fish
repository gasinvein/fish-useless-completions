function __fish_port_no_subcommand --description 'Test if port has yet to be given the subcommand'
	for i in (commandline -opc)
		if contains -- $i search info notes variants deps rdeps dependents rdependents install uninstall select activate deactivate setrequested unsetrequested installed location contents provides sync outdated upgrade rev-upgrade clean log logfile echo list mirror version platform selfupdate load unload gohome usage help dir work cd file url cat edit fetch checksum extract patch configure build destroot test lint distcheck distfiles livecheck pkg mpkg dmg mdmg rpm srpm dpkg
			return 1
		end
	end
	return 0
end

function __fish_port_use_portnames --description 'Test if port command should have packages as potential completion'
	for i in (commandline -opc)
		if contains -- $i info notes variants deps rdeps dependents rdependents install uninstall select activate deactivate setrequested unsetrequested installed location contents upgrade clean log logfile echo list mirror load unload gohome dir work cd file url cat edit fetch checksum extract patch configure build destroot test lint distcheck distfiles livecheck pkg mpkg dmg mdmg rpm srpm dpkg
			return 0
		end
	end
	return 1
end

function __fish_port_use_selectors --description 'Test if port command should have packages as potential completion'
	for i in (commandline -opc)
		if contains -- $i list search uninstall clean echo info depof rdepof dependentof rdependentof
			return 0
		end
	end
	return 1
end

function __fish_port_list --description 'Suggest port names'
	set input (commandline -to)
	if test "$input" != ""
		#command port search --line --regex --name "^$input*" | cut -f 1,2,4
		command grep -e "^$input*" ~/.local/share/fish/completions/port_list.txt | cut -f 1,2,4
	end
end

# Pseudo portnames
complete -c port -n '__fish_port_use_portnames' -f -a "all" -d "all the ports in each ports tree listed in sources.conf"
complete -c port -n '__fish_port_use_portnames' -f -a "current" -d "the port in the current working directory"
complete -c port -n '__fish_port_use_portnames' -f -a "active" -d "set of installed and active ports"
complete -c port -n '__fish_port_use_portnames' -f -a "inactive" -d "set of installed but inactive ports"
complete -c port -n '__fish_port_use_portnames' -f -a "actinact" -d "set of installed ports that have both an active version and one or more inactive versions"
complete -c port -n '__fish_port_use_portnames' -f -a "installed" -d "set of all installed ports"
complete -c port -n '__fish_port_use_portnames' -f -a "uninstalled" -d "ports in the ports tree(s) that arent installed"
complete -c port -n '__fish_port_use_portnames' -f -a "outdated" -d "installed ports that are out of date with respect to their current version/revision in the ports tree(s)"
complete -c port -n '__fish_port_use_portnames' -f -a "obsolete" -d "set of ports that are installed but no longer exist in any port tree"
complete -c port -n '__fish_port_use_portnames' -f -a "requested" -d "installed ports that were explicitly asked for"
complete -c port -n '__fish_port_use_portnames' -f -a "unrequested" -d "installed ports that were installed only to satisfy dependencies"
complete -c port -n '__fish_port_use_portnames' -f -a "leaves" -d "installed ports that are unrequested and have no dependents"

# Selectors
complete -c port -n '__fish_port_use_selectors' -f -a "name:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "version:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "revision:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "epoch:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "variant:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "variants:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "category:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "categories:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "maintainer:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "maintainers:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "platform:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "platforms:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "description:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "long_description:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "homepage:" -d "Selector"
complete -c port -n '__fish_port_use_selectors' -f -a "portdir:" -d "Selector"

# Real port names
complete -c port -n '__fish_port_use_portnames' -f -a '(__fish_port_list)' -d 'MacPort'

# BASIC OPTIONS
complete -c port -s "v" -d 'verbose mode (generate verbose messages).'
complete -c port -s "d" -d 'debug mode (generate debugging messages, implies v ).'
complete -c port -s "q" -d 'quiet mode (suppress messages).'
complete -c port -s "n" -d 'dont upgrade dependencies (affects upgrade and install).'
complete -c port -s "R" -d 'also upgrade dependents (only affects upgrade) … [See Man Page]'
complete -c port -s "u" -d 'uninstall non-active ports when upgrading and uninstalling.'
complete -c port -s "f" -d 'force mode (ignore state file).'
complete -c port -s "o" -d 'honor state files even if the Portfile has been… [See Man Page]'
complete -c port -s "s" -d 'source-only mode (build and install from source… [See Man Page]'
complete -c port -s "b" -d 'binary-only mode (build and install from binary… [See Man Page]'
complete -c port -s "c" -d 'autoclean mode (execute clean after install).'
complete -c port -s "k" -d 'keep mode (dont autoclean after install).'
complete -c port -s "D" -d 'specify portdir.'
complete -c port -s "F" -d 'Read and process the file of commands specified… [See Man Page]'
complete -c port -s "p" -d 'Despite any errors encountered, proceed to proc… [See Man Page]'
complete -c port -s "y" -d 'Perform a dry run.'
complete -c port -s "t" -d 'enable trace mode debug facilities on platforms… [See Man Page]'

# ACTIONS OPTIONS
# clean
complete -c port -n "contains clean (commandline -opc)" -l "work" -d "remove the work files"
complete -c port -n "contains clean (commandline -opc)" -l "dist" -d "remove the distribution files"
complete -c port -n "contains clean (commandline -opc)" -l "archive" -d "remove the downloaded archives"
complete -c port -n "contains clean (commandline -opc)" -l "logs" -d "remove the log files for a port"
complete -c port -n "contains clean (commandline -opc)" -l "all" -d "remove the work files, distribution files, temporary archives and logs"
# search
complete -c port -n "contains search (commandline -opc)" -l "case-sensitive" -d "match the search string in a case-sensitive manner"
complete -c port -n "contains search (commandline -opc)" -l "exact" -d "match the literal search string exactly"
complete -c port -n "contains search (commandline -opc)" -l "glob" -d "treat the given search string as a glob (default)"
complete -c port -n "contains search (commandline -opc)" -l "line" -d "print each result on a single line"
complete -c port -n "contains search (commandline -opc)" -l "regex" -d "treat the given search string as a regular expression"
#complete -c port -n "contains search (commandline -opc)" -l "<field>" -d "match against <field>, default is '--name --description'"

# USER TARGETS
# search
complete -c port -n '__fish_port_no_subcommand' -f -a "search" -d "Search for an available port."
# about package
complete -c port -n '__fish_port_no_subcommand' -f -a "info" -d "Displays meta-information available for portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "notes" -d "Displays notes for portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "variants" -d "Lists the build variants available for portname."
# dependencies
complete -c port -n '__fish_port_no_subcommand' -f -a "deps" -d "Lists the other ports that are required to build and run portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "rdeps" -d "Recursively lists the other ports that are required to build and run portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "dependents" -d "Lists the installed ports that depend on the port portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "rdependents" -d "Recursively lists the installed ports that depend on the port portname."
# install and uninstall
complete -c port -n '__fish_port_no_subcommand' -f -a "install" -d "Install and activate portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "uninstall" -d "Deactivate and uninstall portname."
# manage
complete -c port -n '__fish_port_no_subcommand' -f -a "select" -d "For a given group, selects a version to be the default by creating appropriate symbolic links."
complete -c port -n '__fish_port_no_subcommand' -f -a "activate" -d "Activate the installed portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "deactivate" -d "Deactivate the installed portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "setrequested" -d "Mark portname as requested."
complete -c port -n '__fish_port_no_subcommand' -f -a "unsetrequested" -d "Mark portname as unrequested."
# information
complete -c port -n '__fish_port_no_subcommand' -f -a "installed" -d "Show the installed versions and variants for portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "location" -d "Print the install location of a given port."
complete -c port -n '__fish_port_no_subcommand' -f -a "contents" -d "Lists the files installed by portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "provides" -d "Determines which port owns a given file and can take either a relative or absolute path."
# update and upgrade
complete -c port -n '__fish_port_no_subcommand' -f -a "sync" -d "Performs a sync operation on the ports tree."
complete -c port -n '__fish_port_no_subcommand' -f -a "outdated" -d "List the installed ports that need upgrading."
complete -c port -n '__fish_port_no_subcommand' -f -a "upgrade" -d "The upgrade target works on a port and its dependencies."
complete -c port -n '__fish_port_no_subcommand' -f -a "rev-upgrade" -d "Manually check for broken binaries and rebuild ports containing broken binaries."
# cleaning
complete -c port -n '__fish_port_no_subcommand' -f -a "clean" -d "Clean the files used for building portname."
# misc
complete -c port -n '__fish_port_no_subcommand' -f -a "log" -d "Parses and shows log files for portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "logfile" -d "Displays the path to the log file for portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "echo" -d "Writes to stdout the arguments passed to port."
complete -c port -n '__fish_port_no_subcommand' -f -a "list" -d "If no argument is given, display a list of the latest version of all available ports."
complete -c port -n '__fish_port_no_subcommand' -f -a "mirror" -d "Create/update a local mirror of distfiles used for ports given on the command line."
# self management
complete -c port -n '__fish_port_no_subcommand' -f -a "version" -d "Display the release number of the installed MacPorts infrastructure."
complete -c port -n '__fish_port_no_subcommand' -f -a "platform" -d "Display the platform information for the current system."
complete -c port -n '__fish_port_no_subcommand' -f -a "selfupdate" -d "Updates the MacPorts system, ports tree(s) and base tools if needed."
# daemons
complete -c port -n '__fish_port_no_subcommand' -f -a "load" -d "Provides a shortcut to using launchctl to load a ports daemon."
complete -c port -n '__fish_port_no_subcommand' -f -a "unload" -d "A shortcut to launchctl, like load, but unloads the daemon."
# help
complete -c port -n '__fish_port_no_subcommand' -f -a "gohome" -d "Loads the home page for the given portname in the default web browser."
complete -c port -n '__fish_port_no_subcommand' -f -a "usage" -d "Displays a condensed usage summary."
complete -c port -n '__fish_port_no_subcommand' -f -a "help" -d "Displays a summary of all available actions and port command syntax on stdout."
# PACKAGING TARGETS
complete -c port -n '__fish_port_no_subcommand' -f -a "pkg" -d "Creates an OS X installer package of portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "mpkg" -d "Creates an OS X installer metapackage of portname and its dependencies."
complete -c port -n '__fish_port_no_subcommand' -f -a "dmg" -d "Creates an internet-enabled disk image containing an OS X package of portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "mdmg" -d "Creates an internet-enabled disk image containing an OS X metapackage of portname and its dependencies."
complete -c port -n '__fish_port_no_subcommand' -f -a "rpm" -d "Creates an RPM binary package of portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "srpm" -d "Creates a SRPM source package of portname."
complete -c port -n '__fish_port_no_subcommand' -f -a "dpkg" -d "Creates a DEB binary package of portname."