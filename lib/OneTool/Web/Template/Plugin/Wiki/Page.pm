package OneTool::Web::Template::Plugin::Wiki::Page;

=head1 NAME

OneTool::Web::Template::Plugin::Wiki::Page

=cut

use strict;
use warnings;
use base 'Template::Plugin';

#use Template::Plugin;

#my $template = Template->new({
#    PLUGIN_BASE => 'OneTool::Web::Template::Plugin',
#});

#use Text::Markdown 'markdown';

#use OneTool::Wiki::Server::Page;

#my $TT = Template->new({ PLUGIN_BASE => 'OneTool::Web::Template::Plugin' });

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

=head2 load($page_name)

=cut

sub load
{
    my ($self, $page_name) = @_;

    #my $markdown = OneTool::Wiki::Server::Page::Load($page_name);
    #my $processed = $markdown;
    #$TT->process(\$markdown, undef, \$processed);
    #my $html = markdown($processed);

    return ('<h1>header one </h1>'); #$html);
}

1;

=head1 AUTHOR

Sebastien Thebert <contact@onetool.pm>

=cut