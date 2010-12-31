package ChairDancing::Schema::UserProfile;
use Moose;
use namespace::autoclean;

  has forename  => (
    isa         => 'Str',
    is          => 'rw',
  );
  has surname   => (
    isa         => 'Str',
    is          => 'rw',
  );
1;
__END__

=head1 NAME        

ChairDancing::Schema::UserProfile

=head1 SYNOPSIS    

- general usage of the class

=head1 DESCRIPTION 

- more in-depth purpose and description of the class

=head1 INSTANCE METHODS 

- all instance methods, including argument types and optionality/defaults for each argument

=head1 SEE ALSO    

- references to other, related documents

=head1 AUTHOR

redchair<contact AT chairdancing.at>

=cut

