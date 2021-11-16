Pod::Spec.new do |s|
  s.name             = 'HIRequestLib'
  s.version          = '0.0.1'
  s.summary          = 'network'

  s.homepage         = 'https://github.com/zongmumask/HIRequestLib.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zongmumask' => 'zongmumask@gmail.com' }
  s.source           = { :git => 'https://github.com/zongmumask/HIRequestLib.git', :tag => s.version.to_s }

  s.static_framework = true
  s.ios.deployment_target = '9.0'
  
  s.libraries = 'c++', 'ssl', 'crypto', 'GMWebSSL'
  s.source_files = 'HIRequestLib/Classes/**/*'
  s.vendored_libraries = 'HIRequestLib/Vendors/gmsslsim/lib/libssl.a', 'HIRequestLib/Vendors/gmsslsim/lib/libcrypto.a', 'HIRequestLib/Vendors/GMWebSSL/lib/libGMWebSSL.a'
  s.pod_target_xcconfig = { 'HEADER_SEARCH_PATHS' => '"$(PODS_TARGET_SRCROOT)/HIRequestLib/Vendors/gmsslsim/include/" "$(PODS_TARGET_SRCROOT)/HIRequestLib/Vendors/gmsslsim/include/openssl/" "$(PODS_TARGET_SRCROOT)/HIRequestLib/Vendors/GMWebSSL/include/"', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
  s.preserve_paths = 'HIRequestLib/Vendors'

  s.dependency 'AFNetworking'
  s.dependency 'YYCache'
  s.dependency 'PromisesObjC'
  s.dependency 'ReactiveObjC'
  s.dependency 'MBProgressHUD'
  
end
