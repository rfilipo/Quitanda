

package Quitanda::Fornecedor;

use Moose;
use namespace::autoclean;




#UML_MODELER_BEGIN_PERSONAL_VARS_Fornecedor

#UML_MODELER_END_PERSONAL_VARS_Fornecedor

extends("Quitanda::Controller");

=head3 BUILD

=cut

sub BUILD {
	my $self = shift;
        $self->resultset('Fornecedor');
	return 1;
}





=head1 FORNECEDOR



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
