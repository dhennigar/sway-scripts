#!/usr/bin/perl

# sway-run-or-raise.pl --- focus a program if it is open; else, launch it.

# Copyright (c) 2024 Daniel Hennigar

# This program is dual-licensed under the GNU General Public License, version 3, or
# the Artistic License, version 2.0. You may choose to use, modify, and redistribute
# it under either of these licenses.

use 5.032;

# Check arguments
if (@ARGV < 2) {
    die "Usage: $0 <app_id or class> <command>\n";
}

my ($identifier, $command) = @ARGV;

# Try focusing the app using app_id
my $focus_by_app_id = system("swaymsg", "[app_id=$identifier] focus") == 0;

# If focusing by app_id failed, try focusing by class
unless ($focus_by_app_id) {
    my $focus_by_class = system("swaymsg", "[class=$identifier] focus") == 0;

    # If both attempts failed, execute the command
    unless ($focus_by_class) {
        system("swaymsg", "exec", $command);
    }
}
