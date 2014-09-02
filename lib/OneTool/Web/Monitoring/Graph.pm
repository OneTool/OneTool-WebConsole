package OneTool::Web::Monitoring::Graph;

=head1 NAME

OneTool::Web::Monitoring::Graph - OneTool Web Monitoring Graph module

=cut

use strict;
use warnings;

use Mojo::Base 'Mojolicious::Controller';

=head1 SUBROUTINES/METHODS

=head2 timeline()

=cut

sub timeline
{
    my $self = shift;
    
    my ($device, $check, $key) = (
        $self->param('device'), $self->param('check'), $self->param('key')
        );

    $self->render(template => 'monitoring/timeline');
}

1;

=head1 AUTHOR

Sebastien Thebert <contact@onetool.pm>

=cut