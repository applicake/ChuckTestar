guard 'spork' do
  watch(%r{^lib/(.+)\.rb})
  watch('spec/spec_helper.rb')
end

guard 'rspec', :cli => '--color --format doc' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
