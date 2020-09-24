#
# $Id: dot.cshrc,v 1.10 1995/06/27 02:02:34 sls Exp $
#
# csh initialization occurs here -- it is best if you do not modify
# this file.  Customizations should go in ~/.rc/user_aliases and
# ~/.rc/user_env.  See the CS Unix User Guide in /vol/pub/environ/doc
# for more information.
#
# You will find a summary of the files in ~/.rc in ~/.rc/README.
#
# Send your suggestions and bug reports to Sam Shen <slshen@lbl.gov>.
#

bindkey -d

if ( ! $?prompt ) then
	set interactive = 0
else
	if ("$prompt" == "" || $?RUNNING_AT ) then
		set interactive = 0
	else
		set interactive = 1
	endif
endif

if ($interactive) then
#	echo -n "(reading"
	alias echo_source 'echo " \!*"; source \!*'
#	alias echo_source 'echo -n " \!*"; source \!*'
else
	alias echo_source source
endif

if ( $interactive ) then
	set dot_version = "0.0"
	if (-e $HOME/.rc/version) then
		source $HOME/.rc/version
	endif
	set dot_lib_version = $dot_version
endif

if (-e $HOME/.rc/init) then
	echo_source $HOME/.rc/init
endif

