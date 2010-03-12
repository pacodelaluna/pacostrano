load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'init'
load 'pacostrano'
Dir['./*/*.rb'].each { |file| load(file) }
