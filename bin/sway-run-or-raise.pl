#!/usr/bin/perl
use strict;
use warnings;

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
