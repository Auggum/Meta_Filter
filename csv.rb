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

    arr = ['1296', '1297', '1298', '1299', '1300', '1346']
    links = arr

    if (links.include? (row_id))
    row_description = ''
    end

    def output_update(r_desc, r_id)
      puts "UPDATE pp SET pp.meta_description = \"#{r_desc}\" WHERE pp.id = #{r_id};"
    end

    if (length >= 160)
      period_find = (0..160).find_all {|i| row_description[i, 1] == '.'}
      period = period_find

      if (!period.empty?)
        output_update(row_description[0..period.last], row_id)
      end

    else

      output_update(row_description[0..160], row_id)
    end
  end
end

