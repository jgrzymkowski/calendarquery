module DateUtil
  def at_beginning_of_day( datetime )
    DateTime.strptime(datetime.strftime('%Y-%m-%dT00:00:00%:z'))
  end
end
