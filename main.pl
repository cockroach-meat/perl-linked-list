use v5.42;
use strict;
use warnings;

use Data::Dumper;

use FindBin;
use lib "$FindBin::Bin/lib";

use LinkedList;

my $list = LinkedList->new();

say 'Adding a few elements...';
$list->append('foo');
$list->append('bar');
$list->append('baz');
$list->append('qux');
$list->iterate();

say 'Removing from head...';
$list->remove();
$list->iterate();

say 'Removing from tail...';
$list->delete();
$list->iterate();

say 'The final size is ' . $list->size();
