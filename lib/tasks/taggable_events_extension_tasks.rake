namespace :radiant do
  namespace :extensions do
    namespace :taggable_events do
      
      desc "Runs the migration of the Taggable Events extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          TaggableEventsExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          TaggableEventsExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Taggable Events to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from TaggableEventsExtension"
        Dir[TaggableEventsExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(TaggableEventsExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
