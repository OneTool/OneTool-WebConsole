package OneTool::Web::LogManagement::Device;

=head1 NAME

OneTool::Web::LogManagement::Device - OneTool Web LogManagement Device module

=cut

use strict;
use warnings;

use Mojo::Base 'Mojolicious::Controller';
use Mojo::UserAgent;

=head1 SUBROUTINES/METHODS

=head2 list()

=cut

sub list
{
	my $self = shift;

	my $config = $self->stash('config');
	my $servers = $config->{servers};

	my $ua = Mojo::UserAgent->new;
	my @devices = ();
	my @flash_messages = ();
	foreach my $s (@{$servers})
	{
		my $res = $ua->get("$s/devices")->res;
		if (defined $res->json)
		{
			push @devices, @{$res->json};
		}
		else
		{
			push @flash_messages, 
				{ 
				type => 'ERROR', 
				msg => "Unable to connect to LogManagement Server $s" 
				};
		}	
	}
	$self->flash(messages => \@flash_messages);
	
	$self->stash(servers => $servers, devices => \@devices);
	$self->render(template => 'logmanagement/device/list');
}

=head2 models

=cut

sub models
{
	my $self = shift;

	my $device_type = $self->param('device_type');

	my $config = $self->stash('config');
    my $servers = $config->{servers};

	my $ua = Mojo::UserAgent->new;
    my @device_models = ();
    foreach my $s (@{$servers})
    {
        push @device_models,
            @{$ua->get("$s/device_models/$device_type")->res->json};
    }

	$self->render(json => \@device_models);
}

sub services
{
	my $self = shift;

    my $device_name = $self->param('device_name');

	$self->render(template => 'logmanagement/device/services');
}

sub load
{
    my ($self, $page_name) = @_;
    
    return ('<h1>header one </h1>');
}

1;

=head1 AUTHOR

Sebastien Thebert <contact@onetool.pm>

=cut
