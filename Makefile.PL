use strict;
use inc::Module::Install;
name 'POE-Component-Server-NSCA';
author 'Chris Williams <chris@bingosnet.co.uk>';
license 'perl';
version_from 'lib/POE/Component/Server/NSCA.pm';
abstract_from 'lib/POE/Component/Server/NSCA.pm';
build_requires 'Test::More' => 0.47;
requires 'warnings::compat' => 0 if $] < 5.006;
requires 'Carp' => 0;
requires 'Socket' => 0;
requires 'Net::Netmask' => 1.9015;
requires 'Math::Random' => 0.70;
requires 'POE'    => 0.38;
requires 'POE::Wheel::SocketFactory' => 0;
requires 'POE::Wheel::ReadWrite' => 0;
requires 'POE::Filter::Stream' => 0;
requires 'POE::Component::Client::NSCA' => 0.06;
my $value = prompt( 'Do you want encryption ( requires Mcrypt ) [y/N]?', 'N' );
requires 'Mcrypt' => 2.5 if $value =~ /^y/i;
clean_files 'send_nsca.tests';
my $send_nsca = prompt( 'Specify the path to the "send_nsca" program (leave blank to skip) []?', '' );
if ( $send_nsca and -e $send_nsca ) {
  open FH, "> send_nsca.tests" or die "$!\n";
  print FH "$send_nsca\n";
  close FH;
}
WriteAll();
