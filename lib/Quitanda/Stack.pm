

package Quitanda::Stack;

use Moose;
use namespace::autoclean;




#UML_MODELER_BEGIN_PERSONAL_VARS_Stack

#UML_MODELER_END_PERSONAL_VARS_Stack

extends("Quitanda::Controller");

=head3 BUILD

=cut

sub BUILD {
	my $self = shift;
        $self->resultset('Stack');
	return 1;
}




=head1 STACK



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
