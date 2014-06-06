use strict;
use warnings;

#Get user-specified filepath
my $file = $ARGV[0];

#Read user-specified cutoff date. We will only keep log messages on or after this date
my $cutoffDate = $ARGV[1];

#Extract the month, day and year from the cutoff date with the following format MM/DD/YYYY
$cutoffDate =~ /(\d+)\/(\d+)\/(\d\d\d\d).*/gs;
my $cutoffMonth = $1;
my $cutoffDay = $2;
my $cutoffYear = $3;

my $logDate = "";
my $logMonth = "";
my $logDay = "";
my $logYear = "";

print "Last Truncation: $cutoffMonth - $cutoffDay - $cutoffYear\n";

open my $fh, '<:utf8', $file or die "File read error";

#Iterate through each line of the log file
while (my $line = <$fh>) {
  chomp $line;
	$logDate = "";
	#Extract month day and year from log line
  my @strings = $line =~ /(\d+)\/(\d+)\/(\d\d\d\d)\s.*/gs;
  foreach my $s (@strings) {
		$logMonth = $1;
		$logDay = $2;
		$logYear = $3;

		#Basic date comparison, print the log line only if the date is >= the cutoffDate
		if (($logYear > $cutoffYear) || (($logYear == $cutoffYear) && ($logMonth > $cutoffMonth)) || (($logYear == $cutoffYear) && ($logMonth == $cutoffMonth) && ($logDay >= $cutoffDay))) { 
			print "$line";
    	print "\n";
		}
  }
}

