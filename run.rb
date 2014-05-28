#!/usr/bin/env ruby

require 'optparse'
require 'optparse/date'
require_relative './model/calendar_query'
require_relative './model/puts_printer'

options = {}
opt_parser = OptionParser.new do |opts|
  opts.banner = 'Usage: cal.rb [options]'

  opts.separator ''

  opts.on('-s', '--start DATE', Date, 'Earliest date for time slot options.') do |start_date|
    options[:start_date] = start_date
  end

  opts.on('-e', '--end DATE', Date, 'Latest date for time slot options.') do |end_date|
    options[:stop_date] = end_date
  end

  opts.on('-d', '--days STRING', String, 'Acceptable days of the week as a binary string (i.e. 0101011)') do |days|
    options[:days] = days
  end

  opts.on('-x', '--start-time STRING', String, 'Lower bound for time of day start (i.e. 09:00:00)') do |days|
    options[:start_time] = days
  end

  opts.on('-y', '--end-time STRING', String, 'Upper bound for time of day start (i.e. 17:00:00)') do |days|
    options[:stop_time] = days
  end

  opts.on('-c', '--cal ARRAY', Array, 'List of Google Calendar IDs to compare for free time slots.') do |calendars|
    options[:calendar_ids] = calendars
  end

  opts.on('-h', '--help', 'Show help.') do
    puts opts
    exit
  end

end

opt_parser.parse!

query = CalendarQuery.new( PutsPrinter.new, options )
query.run
