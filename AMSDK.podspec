Pod::Spec.new do |s|
  s.platform = :ios, "7.0"
  s.name     = 'AMSDK'
  s.version  = '1.1.1'
  s.license  = 'MIT'
  s.summary  = 'native ad SDK.'
  s.homepage = 'https://github.com/AMKaffiOS/AMSDK'
  s.authors  = { 'AMKaffiOS' => '18811761720@163.com' }
  s.source   = { :git => 'https://github.com/AMKaffiOS/AMSDK.git', :tag => s.version, :submodules => true }
  s.requires_arc = true
  s.vendored_frameworks = 'framework/KaffADSDK.framework'
  s.source_files = 'framework/KaffADSDK.framework/Headers/*.h'
  s.frameworks = 'Foundation'
  s.library = 'sqlite3'
end