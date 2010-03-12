namespace :debugging do

	desc "Run Production Log Analyzer"
	task :planalyze do
		stream("pl_analyze #{current_release}/log/#{rails_env}.log")
	end

	desc "Print the end of the current environment log file"
	task :tail_logs do
		stream("tail -n 300 #{current_release}/log/#{rails_env}.log")
	end

	desc "Show output of top"
	task :top_return do
		run "top -b -n1" do |channel, stream, data|
			# This does the same thing as the stream method below
			puts data if stream == :out
			if stream == :err
				puts "[err: #{channel[:host]}] #{data}"
				break
			end
		end
	end

end
