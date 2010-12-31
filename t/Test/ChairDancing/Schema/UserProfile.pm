package Test::ChairDancing::Schema::UserProfile;

use Test::Class::Most parent => 'Test::ChairDancing';
use Test::More 'no_plan';

use ok 'ChairDancing::Schema::UserProfile';

sub basic : Tests {
  my $self  = shift;

  my $profile = ChairDancing::Schema::UserProfile->new(
    forename  => 'Aurther',
    surname   => 'Daily',
  );

  isa_ok( $profile, 'ChairDancing::Schema::UserProfile' );
  is    ( $profile->forename, 'Aurther', 'correct forename' );
  is    ( $profile->surname, 'Daily', 'correct surname' );
}
1;
