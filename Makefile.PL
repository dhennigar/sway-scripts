use ExtUtils::MakeMaker;

WriteMakefile(
	NAME		=> 'SwayScripts',
	AUTHOR		=> 'Daniel Hennigar <danrhennigar@gmail.com>',
	ABSTRACT	=> 'A collection of scripts for i3/sway',
	VERSION		=> '0.01',
	EXE_FILES	=> ['bin/sway-new-workspace.pl', 'bin/sway-run-or-raise.pl', 'bin/sway-title-status.pl' ],
	PREREQ_PM	=> {
		'AnyEvent::I3' => 0,
	},
);
