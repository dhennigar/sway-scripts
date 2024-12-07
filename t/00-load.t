use Test::More tests => 3;

ok(-e 'bin/sway-new-workspace.pl', 'sway-new-workspace.pl exists');
ok(-e 'bin/sway-run-or-raise.pl', 'sway-run-or-raise.pl exists');
ok(-e 'bin/sway-title-status.pl', 'sway-title-status.pl exists');
