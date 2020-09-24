To use these files:

git clone https://github.com/bltierney/dotfiles.git
cp cshrc $HOME/.cshrc
cp exrc $HOME/.exrc
ln -s $HOME/.cshrc $HOME/.tcshrc
mkdir $HOME/scripts
cp tpack $HOME/scripts
cp tunpack $HOME/scripts


Below is the orginal README from LBL computing services. Several of the files are not included here.
These scripts assume using tcsh as the shell.
===================================================================================================
The environ Files
-----------------

The files in this directory can be divided into two types: the
read-only ones that are part of the LBL CS dot files, and the ones
that you can use to customize your setup.  The LBL CS dot files are
copied from

	/vol/pub/environ/lib

when you first log in, and whenever new dot files are available.  Your
customization files are named user_*.

aliases 	sets up the shell for interactive use.  Only sourced
		when the shell is "interactive".
user_aliases 	your customizations for interactive use (typically
		your csh aliases).
env		sets up the shell, always sourced.
user_env	your customizations.  Typically you would put environment
		variable definitions here (maybe setting your PRINTER,
		PAGER, and EDITOR.)
modules		sourced if modules are available.  If user_modules doesn't
		load a window system then it will load openwin.
user_modules	your modules customizations.  Place module qload commands
		here to load the modules that you want.
init		sourced when the shell starts.
user_fini	your file, it will be sourced after init is finished.
user_path	your initial path will default to
		  /vol/local/bin /vol/local /usr/ucb /bin /usr/bin
		If ~/.rc/user_path exists it will be sourced to set up an
		alternate default path.
version		holds the version number of the set of dot files that you
		have
emacs.el	GNU Emacs startup file.
user_emacs.el	your customizations to emacs.el
fvwm*		fvwm configuration file parts.
user_fvwm*	your customizations to fvwm*.  See build_fvwm for
		how the parts go together.
user_xinitrc.N	per-screen script, run when MIT X11 starts (N = screen number)
user_xinit	per-display script, run when MIT X11 starts
Xresources	default X resources, loaded with xrdb when using MIT X11.
~/.Xresources	your custom X resources, loaded with xrdb when using MIT X11.

There is additional documentation in /vol/pub/environ/doc.  To print
it out use:

	lpr -Pps-printer /vol/pub/environ/doc/environ.ps

where "ps-printer" is a PostScript printer on the distributed printing
system, such as hp4d.  To view the documentation under X11 or Open
Windows, use:

	module load TeX
	xdvi /vol/pub/environ/doc/environ.dvi

Frequently Asked Questions
--------------------------

1. Where do I add an alias?  Add the alias command to ~/.rc/user_aliases.

2. Where do I set an environment variable?  Add the setenv command
to ~/.rc/user_env.

3. I've edited my ~/.rc/user_* files, how do I reload them?  The simplest
way is to log out and log in again.  Alternatively you can type
`source ~/.cshrc', but this may not reload everything (modules are
not loaded twice.)

4. Where do I modify my path?  If you're modifying your path in
order to include a specific package, then you should probably be
loading the module instead.  See question 5.  However, if you'd
like to set your initial path then you may do so in ~/.rc/user_path.
For example, if you wanted to add ~/bin to your path, put the line:

	set path = ( ~/bin /vol/local/bin /vol/local /usr/ucb /bin /usr/bin )

in ~/.rc/user_path.

5. How do I add modules permanently?  `module initload' doesn't work!
Add `module load' (or maybe `module qload' which won't complain if
the module doesn't exist) commands to ~/.rc/user_modules.

6. Why won't the shell run programs that are in the current directory?
By default, `.' (the current directory) is left out from the path.
To run a program in the current directory, type `./program-name'.
See question #4 if you want to add `.' to your path.

7. Backspace doesn't work, help!  Try typing:

	stty erase <backspace-key>

(Hit the backspace key for <backspace-key>.)  Some of the suggestions
in questions 7 may help as well.

8. My terminal is screwed up, help!  Try typing:

	reset<control-j>

(<control-j> means hold the control key and press j.)  You can also
try typing `termset' and typing in the name of your terminal, or:

	eval `resize`

Or `stty rows 24' and `stty cols 80' (or however many rows and cols
your terminal has.)

9. My printouts go to some mysterious printer unless I use
`lpr -P<printer>', help!  Set the environment variable PRINTER (see
question 2) to the name of the printer you want to use.

10. What's this umask thing, and how do I set it?  When new files are
created, they get a default set of permissions from a number that's
called your umask.  See the man page for umask for more information.
Typical umask's are 022 (giving group members and others read & execute
privledges), 027 (giving group members read & execute, and giving
others none), and 077 (denying permission to people other than
yourself.)  Your umask defaults to 077, if you want a different
one add the line:

	umask xxx

to ~/.rc/user_env.

