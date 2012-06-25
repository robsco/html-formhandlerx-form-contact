use strict;
use warnings;

use Test::More;
use Test::Exception;

use HTML::FormHandlerX::Form::Contact;

my $form;


lives_ok { $form = HTML::FormHandlerX::Form::Contact->new( active => [ qw( name email telephone subject message ) ] ); } "instantiated dumb form ok";

lives_ok { $form->process( params => { name => undef ,
                                       email => "foo" ,
                                       subject => "Something" } ) } "some fields given'";

ok( ! $form->validated, "not validated, as expected!");

ok( ( grep { /name/i && /required/i } $form->errors) , "name is required" );

foreach my $error ( $form->errors )
{
    diag $error;
}

ok( ( grep { /email/i && /format/i } $form->errors ) , "email is invalid" );

ok( ( grep { /telephone/i && /required/i } $form->errors ) , "telephone is required" );

ok( ( grep { /message/i && /required/i } $form->errors ) , "message is required" );





lives_ok { $form = HTML::FormHandlerX::Form::Contact->new( active => [ qw( name email subject message ) ] ); } "instantiated dumb form ok";

lives_ok { $form->process( params => { name => undef ,
                                       email => "foo" ,
                                       subject => "Something" } ) } "some fields given'";

ok( ! $form->validated, "not validated, as expected!");

ok( ( grep { /name/i && /required/i } $form->errors ) , "name is required" );

foreach my $error ( $form->errors )
{
    diag $error;
}

ok( ( grep { /email/i && /format/i } $form->errors ) , "email is invalid" );

ok( ( ! grep { /telephone/i && /required/i } $form->errors ) , "telephone not required" );

ok( ( grep { /message/i && /required/i } $form->errors ) , "message is required" );







lives_ok { $form = HTML::FormHandlerX::Form::Contact->new( active => [ qw( name email subject message ) ] ); } "instantiated dumb form ok";

lives_ok { $form->process( params => { name => 'Rob' ,
                                       email => 'foo@bar.com' ,
                                       subject => "Something", message => 'hello world' } ) } "some fields given'";

ok( $form->validated, "not validated, as expected!");

ok( ( ! grep { /name/i && /required/i } $form->errors ) , "name is there" );

foreach my $error ( $form->errors )
{
    diag $error;
}

ok( ( ! grep { /email/i && /format/i } $form->errors ) , "email is invalid" );

ok( ( ! grep { /telephone/i && /required/i } $form->errors ) , "telephone not required" );

ok( ( ! grep { /message/i && /required/i } $form->errors ) , "message is required" );

ok ( ! $form->errors, " there are no errors" );


done_testing();
