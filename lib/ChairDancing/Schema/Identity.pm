package ChairDancing::Schema::Identity;
use Moose::Role;

  has account => (
    isa       => 'ChairDancing::Schema::UserProfile',
    is        => 'ro',
    required  => 1,
  );
1;
__END__

=head1 NAME        

ChairDancing::Schema::Identity

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

