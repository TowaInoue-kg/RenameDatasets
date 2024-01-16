# 必要なライブラリを読み込む機能(2024/1/16)
require 'fileutils'

# 対象のディレクトリパス指定する機能(2024/1/16)
puts "Enter path"
directory_path = gets.chomp

# コマンドライン上で指定のファイル名を尋ねる機能(2024/1/16)
puts "Enter the base file name:"
base_name = gets.chomp

# ディレクトリ内のファイルを取得する機能(2024/1/16)
files = Dir.entries(directory_path).select { |f| File.file? File.join(directory_path, f) }

# ファイルを1から順番に番号＋指定の名前に変更する機能
files.each_with_index do |file, index|
  ext = File.extname(file)
  new_name = "#{index + 1}_#{base_name}#{ext}"
  FileUtils.mv(File.join(directory_path, file), File.join(directory_path, new_name))
  puts "Renamed: #{file} to #{new_name}"
end
