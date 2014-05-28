calendarquery
=============

To run:

Execute run.rb with the following (optional) commands:

    -s, --start DATE                 Earliest date for time slot options.
    -e, --end DATE                   Latest date for time slot options.
    -d, --days STRING                Acceptable days of the week as a binary string (i.e. 0101011)
    -x, --start-time STRING          Lower bound for time of day start (i.e. 09:00:00)
    -y, --end-time STRING            Upper bound for time of day start (i.e. 17:00:00)
    -c, --cal ARRAY                  List of Google Calendar IDs to compare for free time slots.
    -h, --help                       Show help.
    
Example:

./run.rb -d '0111110' -x '17:00:00' -y '22:00:00' -s '2014-06-01' -e '2014-06-14' -c abc123@group.calendar.google.com,zyx789@group.calendar.google.com
