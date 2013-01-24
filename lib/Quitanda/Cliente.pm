

package Quitanda::Cliente;

use Moose;
use namespace::autoclean;



#UML_MODELER_BEGIN_PERSONAL_VARS_Cliente

#UML_MODELER_END_PERSONAL_VARS_Cliente

extends("Quitanda::Controller");


=head1 CLIENTE

Cliente is the Controller for the data model defined in Quitanda::Schema::Result::Cliente; 

=cut

sub BUILD {
	my $self = shift;
    $self->resultset('Cliente');
    my $config = shift;
    $self->config($config->{client});
    
    #use Data::Dumper;
    #print "My config:\n";
    #print Dumper $config;
    
	return 1;
}



=head1 PUBLIC ATTRIBUTES

=pod 



=cut


=head1 PUBLIC METHODS



=cut


=head1 METHODS FOR SUBCLASSING



=cut


=head1 PRIVATE METHODS



=cut






return 1;
