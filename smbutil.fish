function __fish_smbutil_no_subcommand --description 'Test if smbutil has yet to be given the subcommand'
	for i in (commandline -opc)
		if contains -- $i help lookup status view dfs identity statshares
			return 1
		end
	end
	return 0
end

complete -c smbutil -s "h" -d "Print a short help message"
complete -c smbutil -s "v" -d "Verbose output"

complete -c smbutil -n '__fish_smbutil_no_subcommand' -f -a "help" -d "display help on specified subcommand"

complete -c smbutil -n '__fish_smbutil_no_subcommand' -f -a "lookup" -d "resolve NetBIOS name to IP address"
complete -c smbutil -f -n "contains lookup (commandline -opc)" -s "w" -d "NetBIOS name server"
complete -c smbutil -f -n "contains lookup (commandline -opc)" -s "t" -d "Node type"
complete -c smbutil -f -n "contains lookup (commandline -opc)" -s "e" -d "NetBIOS names will be unpercent escaped"

complete -c smbutil -n '__fish_smbutil_no_subcommand' -f -a "status" -d "resolve IP address or DNS name to NetBIOS names"
complete -c smbutil -f -n "contains status (commandline -opc)" -s "a" -d "All NetBIOS names will be displayed"
complete -c smbutil -f -n "contains status (commandline -opc)" -s "e" -d "All NetBIOS names will be percent escaped out"

complete -c smbutil -n '__fish_smbutil_no_subcommand' -f -a "view" -d "list resources on specified host"
complete -c smbutil -f -n "contains view (commandline -opc)" -s "A" -d "authorize only"
complete -c smbutil -f -n "contains view (commandline -opc)" -s "N" -d "don't prompt for a password"
complete -c smbutil -f -n "contains view (commandline -opc)" -s "G" -d "allow guest access"
complete -c smbutil -f -n "contains view (commandline -opc)" -s "g" -d "authorize with guest only"
complete -c smbutil -f -n "contains view (commandline -opc)" -s "a" -d "authorize with anonymous only"
complete -c smbutil -f -n "contains view (commandline -opc)" -s "f" -d "don't share session"

complete -c smbutil -n '__fish_smbutil_no_subcommand' -f -a "dfs" -d "list DFS referrals"

complete -c smbutil -n '__fish_smbutil_no_subcommand' -f -a "identity" -d "identity of the user as known by the specified host"
complete -c smbutil -f -n "contains identity (commandline -opc)" -s "N" -d "Will not prompt for a password"

complete -c smbutil -n '__fish_smbutil_no_subcommand' -f -a "statshares" -d "list the attributes of mounted share(s)"
complete -c smbutil -f -n "contains statshares (commandline -opc)" -s "m" -d "print the attributes of the share mounted at mount_path"
complete -c smbutil -f -n "contains statshares (commandline -opc)" -s "a" -d "print the attributes of all mounted shares"