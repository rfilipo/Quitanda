package Quitanda::User;

use Moose;
use namespace::autoclean;




#UML_MODELER_BEGIN_PERSONAL_VARS_User

#UML_MODELER_END_PERSONAL_VARS_User

extends("Quitanda::Controller");

=head3 BUILD

=cut

sub BUILD {
	my $self = shift;
        $self->resultset('User');
	return 1;
}

has 'id' => (
    is  => 'rw',
    isa => 'Int',
);
has 'nome' => (
    is  => 'rw',
    isa => 'Str',
);




=head1 USER



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
