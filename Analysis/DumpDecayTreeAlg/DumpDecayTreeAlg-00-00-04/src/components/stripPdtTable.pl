#!/usr/bin/perl

############################################################################
### Change $pdtTableDir,$pdtTableFile by hand if not using default pdt.table

### Input pdt.table and directory
##   BESEVTGENROOT: /afs/ihep.ac.cn/bes3/offline/sw/dist/boss/BOSS#/Generator/BesEvtGen/BesEvtGen-00-00-26
##    BOSS# = BOSS Version, e.g., BOSS# = 6.4.1 

$pdtTableDir = "/afs/ihep.ac.cn/bes3/offline/sw/dist/boss/6.4.1/Generator/BesEvtGen/BesEvtGen-00-00-26/share";
$pdtTableFile = "pdt.table";

## Output file:
$partListFile = "particleListForAlg.txt";

print "\n Change \$pdtTableDir \$pdtTableFile and/or \$partListFile in stripPdtTable.pl if you do not want to use default!!!\n\n";
print "Using pdt.table: $pdtTableDir/$pdtTableFile\n";
print "Output for initialize() section of DumpDecayTreeAlg: $partListFile\n";
############################################################################


#### Open output file
open( PARTLISTFILE, ">$partListFile" ) || die "couldn't open $partListFile";


####  Read run list files
open( INFILE, "$pdtTableDir/$pdtTableFile" )|| die "couldn't open $pdtTableDir/$pdtTableFile";

while ( <INFILE> ) {
    $line = $_;

    next if ($line !~ /add/);

    if($line =~ /(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/ ) 
    {

	#print "\t$1\t$6\t$7\t$8\t$9\n";
	#print "$1\n";
	$name = $7;
	$id = $9;
	##print "$name\t$id\n";
	print PARTLISTFILE "    m_map.insert(make_pair($id,\"$name\"));\n";

    }  # End of "$line =~ ..." IF
	
}  # End of "INFILE" WHILE LOOP

close(PARTLISTFILE);

print "\n Copy/paste $partListFile into initialize() section of DumpDecayTreeAlg!\n\n";

exit;

