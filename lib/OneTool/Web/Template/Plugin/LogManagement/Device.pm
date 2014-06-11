package OneTool::Web::Template::Plugin::LogManagement::Device;

=head1 NAME

OneTool::Web::Template::Plugin::LogManagement::Device

=cut

use strict;
use warnings;
use base 'Template::Plugin';

use Mojo::UserAgent;

#use Octopussy::Device;
#use OneTool::LogManagement::Device;

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

=head2 configuration($device_name)

=cut

sub configuration
{
    my ($self, $device_name) = @_;

    my $conf = undef; #OneTool::LogManagement::Device::configuration($device_name);

    return ($conf);
}

=head2 configurations($sort)

=cut

sub configurations
{
    my ($self, $sort) = @_;

    my @devices = (); #Octopussy::Device::Configurations($sort);

    return (\@devices);
}

=head2 models($device_type)

=cut

sub models
{
    my ($self, $device_type) = @_;

	my $servers = $self->{config}->{servers};

    my $ua = Mojo::UserAgent->new;
    my @device_models = ();
    foreach my $s (@{$servers})
    {
        push @device_models, 
			@{$ua->get("$s/device_models/$device_type")->res->json};
    }

    return (\@device_models);
}

=head2 parser_status

=cut

sub parser_status
{
	my ($self, $status) = @_;

	my $html = '<div class="text-center">'
        . '<span class="label' . ($status =~ /Started/i ? ' label-success' : 
		($status =~ /Paused/i ? ' label-warning' : ' label-important'))
        . '">' . $status . '</span></div>';

    return ($html);
}

=head2 services($device, $sort)

=cut

sub services
{
    my ($self, $device, $sort) = @_;

    my @services = (); #Octopussy::Device::Services_Configurations($device, $sort);

    return (\@services);
}

=head2 types()

=cut

sub types
{
    my $self = shift;

    my @device_types = (); #Octopussy::Device::Types();

    return (\@device_types);
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
