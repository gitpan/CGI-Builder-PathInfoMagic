package CGI::Builder::PathInfoMagic;

use strict;
use base qw/CGI::Builder/;
use vars qw/$VERSION/;
$VERSION = '0.01';

sub process {
    my $s  = shift;
    my $p  = __path_info_magic() || 'index' ;
    
    $s->SUPER::process( $p );
}

sub __path_info_magic{
    my $path = $ENV{PATH_INFO} || '/';
    my @path_entries = split( '/' , $path );
    return join( '_' , @path_entries[1..$#path_entries] );
}

1;

=head1 NAME

CGI::Builder::PathInfoMagic - Get page name from PAHT_INFO instead of p

=head1 DESCRIPTION

This module allow you to set page name from $ENV{PATH_INFO} instead of p. You can check
SYNOPSYS out and you will know what this mean. :-) 

This class inherits from CGI::Builder,  by the way. I like CGI::Builder.

=head1 SYNOPSYS

start.cgi

 #!/usr/bin/perl -w

 use strict;
 use Your::CGI::Builder;
 
 my $app = Your::CGI::Builder->new();
 $app->process();

 __END__

Your CGI::Builder Package.

 package Your::CGI::Builder;
 
 use CGI::Builder::PathInfoMagic qw/
    CGI::Builder::DFVCheck
 /;
 
 sub PH_foo_bar {
    my $s = shift;
    $s->page_content( 'my URL is http://localhost/script.cgi/foo/bar/?foo=whatever !!!!' );
 }
 
 sub PH_hoge {
    my $s = shift;
    $s->page_content = 'my URL is http://localhost/script.cgi/hoge/ !!!' );
 }


=head1 MORE FUN?

Use ScriptAlias !!! This allow you to hide .cgi extension. Very fun.


 ScriptAlias /secure /var/www/httpdoc/secure.cgi

 # You have this start script.
 http://localhost/secure.cgi 

 # You set script alias so , you can also access with this URL.
 http://localhost/secure
 
 # Then now...
 sub PH_foo_bar {
    my $s = shift;
    $s->page_content = 'my URL is http://localhost/secure/foo/bar/?foo=whatever !!!' ;
 }

=head1 OVER RAIDDEDMETHOD

=head2 process()

 You can not set any aregument because I will set it for you . :-)

=head1 SEE ALSO

CGI::Builder

=head1 AUTHOR

Tomohiro Teranishi <tomohiro.teranishi+cpan@gmail.com>

=head1 COPYRIGHT

This program is distributed under the Artistic License

=cut
