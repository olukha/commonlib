#!/usr/bin/perl
# 
# THIS FILE WAS AUTOMATICALLY GENERATED BY ./rabxtopl.pl, DO NOT EDIT DIRECTLY
# 
# NeWs.pm:
# Client interface for NeWs
#
# Copyright (c) 2005 UK Citizens Online Democracy. All rights reserved.
# WWW: http://www.mysociety.org
#
# $Id: NeWs.pm,v 1.1 2006-05-01 15:11:55 louise Exp $

package mySociety::NeWs;

use strict;

use RABX;
use mySociety::Config;

=item configure [URL]

Set the RABX URL which will be used to call the functions. If you don't
specify the URL, mySociety configuration variable NEWS_URL will be used
instead.

=cut
my $rabx_client = undef;
sub configure (;$) {
    my ($url) = @_;
    $url = mySociety::Config::get('NEWS_URL') if !defined($url);
    $rabx_client = new RABX::Client($url) or die qq(Bad RABX proxy URL "$url");
}

=item NeWs::get_newspaper ID

  Given a newspaper ID, returns information about that newspaper

=cut
sub get_newspaper ($) {
    configure() if !defined $rabx_client;
    return $rabx_client->call('NeWs.get_newspaper', @_);
}

=item NeWs::get_newspapers

  Get a list of all the newspapers in the DB

=cut
sub get_newspapers () {
    configure() if !defined $rabx_client;
    return $rabx_client->call('NeWs.get_newspapers', @_);
}

=item NeWs::get_newspapers_by_name

  Get a hash keyed on id of newspapers in the DB matching a partial name
  string

=cut
sub get_newspapers_by_name () {
    configure() if !defined $rabx_client;
    return $rabx_client->call('NeWs.get_newspapers_by_name', @_);
}

=item NeWs::publish_update ID EDITOR HASH

  Update the newspaper with the ID using the attribute values in the hash
  and assigning the update to the username EDITOR.

=cut
sub publish_update ($$$) {
    configure() if !defined $rabx_client;
    return $rabx_client->call('NeWs.publish_update', @_);
}

=item NeWs::get_history ID

  Given a newspaper ID, returns the history of edits to that newspaper's
  record in the database 

=cut
sub get_history ($) {
    configure() if !defined $rabx_client;
    return $rabx_client->call('NeWs.get_history', @_);
}

=item NeWs::get_coverage ID

  Given a newspaper ID, returns the coverage information related to that
  newspaper

=cut
sub get_coverage ($) {
    configure() if !defined $rabx_client;
    return $rabx_client->call('NeWs.get_coverage', @_);
}


1;
