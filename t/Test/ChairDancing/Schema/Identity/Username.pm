package Test::ChairDancing::Schema::Identity::Username;

use Test::Class::Most parent => 'Test::ChairDancing';
use KiokuX::User::Util qw/crypt_password/;
use Test::More 'no_plan';

use ok 'ChairDancing::Schema::Identity::Username';
use ok 'ChairDancing::Schema::UserProfile';

sub basic : Tests {
  my $self  = shift;

  my $profile = ChairDancing::Schema::UserProfile->new(
    forename  => 'Aurther',
    surname   => 'Daily',
  );

  my $identity  = ChairDancing::Schema::Identity::Username->new(
    account     => $profile,
    id          => "AAries",
    password    => crypt_password('settle for my love')
  );

  isa_ok( $identity, 'ChairDancing::Schema::Identity::Username' );
  isa_ok( $identity->account, 'ChairDancing::Schema::UserProfile' );
  is    ( $identity->id, 'AAries', 'correct identity ID' );
  is    ( $identity->account->surname, 'Daily', 'correct identity->account surname' );

  $identity->account->surname('Smith');

  is    ( $identity->account->surname, 'Smith', 'correct identity->account surname after change to "Smith"' );

  my $identity2 = ChairDancing::Schema::Identity::Username->new(
    account     => $profile,
    id          => "Ozone",
    password    => crypt_password('layer')
  );

  isa_ok( $identity2, 'ChairDancing::Schema::Identity::Username' );
  is    ( $identity2->account->surname, 'Smith', 'correct identity2->account surname "Smith"' );

  $identity2->account->surname('Jones');

  is    ( $identity2->account->surname, 'Jones', 'correct identity->account surname after change to "Jones"' );
  is    ( $identity->account->surname, $identity2->account->surname , 'identity & identity2 account surname are identical' );
}
1
