use strict;
use warnings;

use Test::More;
use Test::Exception;

use HTML::FormHandlerX::Form::Contact;

my $form;

lives_ok { $form = HTML::FormHandlerX::Form::Contact->new(); } "instantiated dumb form ok";

lives_ok { $form = HTML::FormHandlerX::Form::Contact->new( active => [ qw( name email telephone subject message ) ] ); } "instantiated dumb form ok";

ok( $form->field('name')->render =~ m:id="field-name":, "Name field wrapper ok");


ok( $form->field('email')->render =~ m:id="field-email":, "Email field wrapper ok");


ok( $form->field('telephone')->render =~ m:id="field-telephone":, "Telephone field wrapper ok");


ok( $form->field('subject')->render =~ m:id="field-subject":, "Subject field wrapper ok");


ok( $form->field('message')->render =~ m:id="field-message":, "Message field wrapper ok");


ok( $form->field('submit')->render =~ m:id="field-submit":, "Submit field wrapper ok");

done_testing();
