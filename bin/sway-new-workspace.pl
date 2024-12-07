#!/usr/bin/perl

use 5.032;
use strict;
use warnings;
use diagnostics;
use Getopt::Std;
use AnyEvent::I3;

my %opts;
getopts('t', \%opts); # -t "take"

my $workspaces = i3->get_workspaces->recv;
my %workspace_numbers;
foreach my $workspace (@$workspaces) {
    $workspace_numbers{$workspace->{num}} = 1;
}

my $lowest_empty_workspace;
my $max_workspace_number = scalar @$workspaces + 1;
for my $i (1..$max_workspace_number) {
    unless (exists $workspace_numbers{$i}) {
        $lowest_empty_workspace = $i;
        last;
    }
}

if (defined $lowest_empty_workspace) {
    if ($opts{t}) {
	i3->command("move to workspace " . $lowest_empty_workspace);
    }
    i3->command("workspace " . $lowest_empty_workspace);
}

