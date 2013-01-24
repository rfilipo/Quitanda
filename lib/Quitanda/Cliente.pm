

package Quitanda::Cliente;

use Moose;
use namespace::autoclean;



#UML_MODELER_BEGIN_PERSONAL_VARS_Cliente

#UML_MODELER_END_PERSONAL_VARS_Cliente

extends("Quitanda::Controller");

sub BUILD {
	my $self = shift;
        $self->resultset('Cliente');
	return 1;
}


=head1 CLIENTE



=cut


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
