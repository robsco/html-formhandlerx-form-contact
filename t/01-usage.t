#!perl -T

use Test::More tests => 1;
use Test::Exception;

use HTML::FormHandlerX::Form::Contact;

my $form;

lives_ok {
	$form = HTML::FormHandlerX::Form::Contact->new();
} "Constructed ok";


