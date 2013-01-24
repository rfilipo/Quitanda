

package Quitanda::Endereco;

use Moose;
use namespace::autoclean;




#UML_MODELER_BEGIN_PERSONAL_VARS_Endereco

#UML_MODELER_END_PERSONAL_VARS_Endereco

extends("Quitanda::Controller");

sub BUILD {
	my $self = shift;
        $self->resultset('Endereco');
	return 1;
}




=head1 ENDERECO



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
