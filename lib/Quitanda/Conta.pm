

package Quitanda::Conta;

use Moose;
use namespace::autoclean;


extends("Quitanda::Controller");

sub BUILD {
	my $self = shift;
        $self->resultset('Conta');
	return 1;
}



#UML_MODELER_BEGIN_PERSONAL_VARS_Conta

#UML_MODELER_END_PERSONAL_VARS_Conta




=head1 CONTA



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
