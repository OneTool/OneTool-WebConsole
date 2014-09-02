package OneTool::Web::Template::Plugin::Monitoring::Data;

=head1 NAME

OneTool::Web::Template::Plugin::Monitoring::Data

=cut

use strict;
use warnings;
use base 'Template::Plugin';

use Mojo::UserAgent;
use Time::Piece;

=head1 SUBROUTINES/METHODS

=head2 new()

=cut

sub new
{
    my ($class, $context, $params) = @_;

    bless {
        _CONTEXT    => $context,
        config      => $params
    }, $class;
}

=head2 to_flot($device, $check, $key)

=cut

sub to_flot
{
    my ($self, $device, $check, $key) = @_;

    my $ua = Mojo::UserAgent->new;
    my @data = ();
    
    my $result = $ua->get("http://127.0.0.1:3000/data/$device/$check/$key")->res->json;
    my $str = '[';
    foreach my $d (@{$result->{"$key"}})
    {
        my $t = Time::Piece->strptime($d->{dt}, "%Y%m%d%H%M%S");
        $str .= '[' . $t->epoch * 1000 . ", $d->{v} ], ";
    }
    $str =~ s/, $/\]/;
    
    return ($str);
}

1;

=head1 AUTHOR

Sebastien Thebert <contact@onetool.pm>

=cut