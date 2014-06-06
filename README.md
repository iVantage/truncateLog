# truncateLog

This simple perl script can be used for truncating log files to only show log entries on or after a specified date. It is useful when log files are programmatically generated and could potentially grow very large. Periodic usage of this script prevents excessive space wastage, while allowing us to decide how much log data we want to preserve based on dates, rather than arbitrarily chopping off lines. This script assumes logs line begin with a date in the MM/DD/YYYY format.

## Installation

1. Install Perl if it is not installed (A few different versions of Perl are available. This was written in ActivePerl version 5.16.3.1604)
2. Ensure that perl can be run from the command line. Windows users may need to adjust their PATH variables for this.
3. Download the script.

## Usage

From the command-line/terminal window, from the directory containing the script enter the following:

```bash
perl truncateLog.perl [path to log file] [cutoff date] > [temporary file]
cp [temporary file] [path to log file]
```

The temporary file can then be deleted. An example run is shown below:

```bash
perl truncateLog.perl WebDebug.txt 1/1/2014 > WebDebug.swp
cp WebDebug.swp WebDebug.txt
```

Hope this helps!

## License 

(The MIT License)

Copyright (c) 2011

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
