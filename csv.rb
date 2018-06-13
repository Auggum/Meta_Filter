require 'csv'

CSV.foreach('/home/augo/Documents/RubyTests/finalchange.csv') do |row|
  row_description = row[2]
  row_id = row[0]
  row_meta_description = row[1]

  if (!row_description.nil? && row_meta_description.nil?)

    row_description.gsub!('<p>', '')
    row_description.gsub!('</p>', '')
    row_description.gsub!('<strong>', '')
    row_description.gsub!('</strong>', '')
    row_description.gsub!('<br />', '')
    length = row_description.length

    #arr = ['1296', '1297', '1298', '1299', '1300', '1346']
    #links = arr
    #if (links == row_id)
      #row_description = ''
    #end

    if (row_id == '1346' || row_id == '1296' || row_id == '1297' || row_id == '1298' || row_id == '1299' || row_id == '1300') #6 specific lines need deleted
      row_description = ''
    end

    if (length >= 160)
      period_find = (0..160).find_all {|i| row_description[i, 1] == '.'}
      period = period_find

      if (!period.empty?)
        puts "UPDATE pp SET pp.meta_description = \"#{row_description[0..period.last]}\" WHERE pp.id = #{row_id};"
      end

    else

      puts "UPDATE pp SET pp.meta_description = \"#{row_description[0..160]}\" WHERE pp.id = #{row_id};"
    end
  end
end

