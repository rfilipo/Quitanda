

package Quitanda::Mercadoria;

use Moose;
use namespace::autoclean;



#UML_MODELER_BEGIN_PERSONAL_VARS_Mercadoria

#UML_MODELER_END_PERSONAL_VARS_Mercadoria

extends("Quitanda::Controller");

=head3 BUILD

=cut

sub BUILD {
	my $self = shift;
    $self->resultset('Mercadoria');
    
    my $config = shift;
    $self->config($config->{mercadoria});
    
	return 1;
}




=head1 MERCADORIA



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
