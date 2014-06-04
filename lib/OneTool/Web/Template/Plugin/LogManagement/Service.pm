package OneTool::Web::Template::Plugin::LogManagement::Service;

=head1 NAME

OneTool::Web::Template::Plugin::LogManagement::Service

=cut

use strict;
use warnings;
use base 'Template::Plugin';

#use Octopussy::Service;
use OneTool::LogManagement::Service;

=head1 SUBROUTINES/METHODS

=head2 new()

=cut

sub new
{
    my ($class, $context, $params) = @_;

    bless {
        _CONTEXT 	=> $context,
		config		=> $params
    }, $class;
}

=head2 configurations($sort)

=cut

sub configurations
{
    my ($self, $sort) = @_;

    my @services = (); #Octopussy::Service::Configurations($sort);

    return (\@services);
}

1;

=head1 AUTHOR

Sebastien Thebert <contact@onetool.pm>

=cut
