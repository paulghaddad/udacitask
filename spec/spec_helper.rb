PROJECT_ROOT = File.expand_path("../..", __FILE__)

Dir.glob(File.join(PROJECT_ROOT, "lib", "*.rb")).each do |file|
  require file
end

Dir.glob(File.join(PROJECT_ROOT, "lib", "exporters", "*.rb")).each do |file|
  require file
end

Dir.glob(File.join(PROJECT_ROOT, "lib", "parsers", "*.rb")).each do |file|
  require file
end
