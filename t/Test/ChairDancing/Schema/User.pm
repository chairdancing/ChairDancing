package Test::ChairDancing::Schema::User;

use Test::Class::Most parent => 'Test::ChairDancing';
use KiokuX::User::Util qw/crypt_password/;
use Test::More 'no_plan';

use ok 'ChairDancing::Schema::User';

sub basic : Tests {
  my $self  = shift;

  my $user  = ChairDancing::Schema::User->new(
    id        => "Adam",
    password  => crypt_password('foobar')
  );

  isa_ok( $user, 'ChairDancing::Schema::User' );
  is    ( $user->id, "Adam", "ID contains correct string" );
  isa_ok( $user->password, "Authen::Passphrase::SaltedDigest", "password returns correct isa object type" );
  ok    ( $user->check_password("foobar"), "correct password validates" );
  ok    ( !$user->check_password("notpassword"), "incorrect password fails to validate" );


}

sub encrypt_password : Tests {
  my $self  = shift;

  my $user  = ChairDancing::Schema::User->new(
    password  => crypt_password(
      class       => 'Authen::Passphrase::SaltedDigest',
      passphrase  => 'foobar',
      algorithm   => 'MD5',
    ) 
  );
  isa_ok( $user->password, "Authen::Passphrase::SaltedDigest", "password returns correct isa object using MD5 algorithm" );
  ok    ( $user->check_password("foobar"), "correct password validates" );
}
1;
