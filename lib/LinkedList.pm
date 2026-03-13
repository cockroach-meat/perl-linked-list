package LinkedList;

use v5.42;
use strict;
use warnings;

sub new {
    my ($class) = @_;

    my $self = bless {}, $class;
    $self->{head} = undef;
    $self->{tail} = undef;

    $self;
}

sub size {
    my ($self) = @_;
    my $node = $self->{head};
    my $len = 0;

    do {
        $len++;
    } while (defined($node = $node->{next}));

    $len;
}

sub get_node {
    my ($self, $index) = @_;
    my $node = $self->{head};

    foreach (1..$index) {
        defined($node = $node->{next}) or die('Index out of range');
    }

    $node;
}

sub get {
    my ($self, $index) = @_;
    get_node($self, $index)->{data};
}

sub set {
    my ($self, $index, $data) = @_;
    get_node($self, $index)->{data} = $data;
}

sub append {
    my ($self, $data) = @_;
    my %node = ();
    $node{'next'} = undef;
    $node{'data'} = $data;
    $self->{tail}->{next} = \%node;
    $self->{tail} = \%node;
    $self->{head} = \%node unless defined($self->{head});
}

sub remove {
    my ($self) = @_;

    $self->{head} = $self->{head}->{next};
}

sub delete {
    my ($self) = @_;
    
    my $ptail = $self->{head};
    $ptail = $ptail->{next} while ($ptail->{next} != $self->{tail});

    $self->{tail} = $ptail;
    $ptail->{next} = undef;
}

sub iterate {
    my ($self) = @_;
    my $i = 0;
    my $node = $self->{head};

    do {
        say $i++ . "\t" . $node->{data};
    } while (defined($node = $node->{next}));
 }
