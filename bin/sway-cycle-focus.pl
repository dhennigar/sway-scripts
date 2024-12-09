#!/usr/bin/env perl
use 5.032;
use AnyEvent::I3;
use SwayScripts::Utils qw(find_current_ws_and_con find_named_child_cons);

# sway-cycle-focus.pl --- emulate "Alt-Tab" behaviour in sway/i3

# Copyright (C) 2024 Daniel Hennigar

# Author: Daniel Hennigar

# This program is dual-licensed under the GNU General Public License,
# version 3, or the Artistic License, version 2.0. You may choose to
# use, modify, and redistribute it under either of these licenses.

my $tree = i3->get_tree->recv;
my ($current_ws, $current_con) = find_current_ws_and_con($tree, undef);
my $cons_in_workspace = find_named_child_cons($current_ws);

for (my $i = 0; $i < @$cons_in_workspace; $i++) {
  if (@$cons_in_workspace[$i] == $current_con->{id}) {
    my $next_id = $cons_in_workspace->[($i + 1) % @$cons_in_workspace];
    say "next id: $next_id";
    i3->command("[con_id=$next_id] focus");
  }
}
