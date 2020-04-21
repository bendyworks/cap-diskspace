
  Pod::Spec.new do |s|
    s.name = 'CapDiskspace'
    s.version = '0.0.1'
    s.summary = "Retrieve information about the disk space of a device"
    s.license = 'Hippocratic'
    s.homepage = 'git@github.com:bendyworks/cap-diskspace.git'
    s.author = 'Brad Grzesiak'
    s.source = { :git => 'git@github.com:bendyworks/cap-diskspace.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end
