package OneTool::Web::Wiki::Page;

=head1 NAME

OneTool::Web::Wiki::Page - OneTool Web Wiki Page module

=cut

use strict;
use warnings;

use Mojo::Base 'Mojolicious::Controller';

=head1 SUBROUTINES/METHODS

=head2 show()

=cut

sub show
{
    my $self = shift;

    my $page_name = $self->param('page_name');

    $self->stash(page_name => $page_name, html => "<h1>$page_name header 1</h1>");
    $self->render(template => 'wiki/page_show');
}

1;

=head1 AUTHOR

Sebastien Thebert <contact@onetool.pm>

=cut