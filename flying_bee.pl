#!/usr/local/bin/perl

# Usage: ./flying_bee.pl

use strict;
use warnings;
use utf8;
use Encode 'decode', 'encode';
use POSIX;

my ($max_x, $max_y, $max_t) = (60, 6, 60);
#🐝🐠🐬🐟🐈🐇🕊🌱🌿🌲🌻
my $bee='🐝';
my $sleeping_seconds=0.1;

#  y
#  |
#  |
# -+--------> x
#  |

for (my $t=0; $t<$max_t; $t++) {
  system('clear');
  my $x_pos = $max_x - ($t % $max_x) -1;
  my $y_pos = floor($max_y / 2.0 * (sin($t * 0.21) + 1.0));
  #print "(t, x, y) = ($t, $x_pos, $y_pos)\n";
  for (my $y=$max_y; 0<=$y; $y--) {
    if ($y==$y_pos) {
      my $this_line='';
      for (my $x=0; $x<=$x_pos; $x++) {
        $this_line .= ' ';
      }
      $this_line .= $bee;
      print encode('utf-8', "$this_line\n");
    } else {
      print "\n";
    }
  }
  system("sleep $sleeping_seconds");
}
