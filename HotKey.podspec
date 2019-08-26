Pod::Spec.new do |spec|
  spec.name = 'HotKey'
  spec.version = '0.1.2'
  spec.authors = {'Sam Soffes' => 'sam@soff.es'}
  spec.homepage = 'https://github.com/soffes/HotKey'
  spec.summary = 'Simple global shortcuts in macOS.'
  spec.source = {:git => 'https://github.com/soffes/HotKey.git', :tag => "v#{spec.version}"}
  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.osx.deployment_target = '10.9'

  spec.frameworks = 'AppKit', 'Carbon'
  spec.source_files = 'Sources/HotKey/**/*.{h,m,swift}'
end
