#!perl -T

use Test::More tests => 8;
use Data::Dumper;
use POSIX qw(strftime);

BEGIN {
    use_ok( 'Quitanda' ) || print "Bail out!
";
}

# the time

$now = strftime "%a %b %e %H:%M:%S %Y", localtime;

# testa CRUD em User.pm
my $obj = new_ok('Quitanda::User');
my $hash_ref = {};

# Create
$hash_ref = $obj->create({
    email     =>'teste@localhost', 
    password  =>'1111111111',
    funcao    => 'admin',
});
ok ($hash_ref,'Criou');
print Dumper $hash_ref;

# Read
$hash_ref = $obj->read({id=>1});
ok ($hash_ref,'Leu');
print Dumper $hash_ref;
is ($hash_ref->{email},'teste@localhost','Email certo'); 

# Update
$hash_ref = $obj->update(
    { id => 1 },
    {
    email => qw(teste@teste),
    }
);
ok ($hash_ref,'Atualizou');
print Dumper $hash_ref;
is ($hash_ref->{email},qw(teste@teste),'Confere email'); 
# Delete
$hash_ref = $obj->delete({id=>1});
ok ($hash_ref,'Deletou');

