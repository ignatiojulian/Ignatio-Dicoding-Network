Pod::Spec.new do |s|
 
s.platform = :ios
s.ios.deployment_target = '14.4'
s.name = "NewsApp_Network"
s.summary = "Dicoding NewsApp_Network.framework for modularization chapter"
s.requires_arc = true
 
s.version = "1.0.0"
 
s.license = { :type => "MIT", :file => "LICENSE" }
 
s.author = { "Ignatio Julian" => "ignatiojulian@gmail.com" }
 
s.homepage = "https://github.com/ignatiojulian/Ignatio-Dicoding-Network"
 
s.source = { :git => "https://github.com/ignatiojulian/Ignatio-Dicoding-Network.git", 
:tag => "#{s.version}" }
 
s.framework = "UIKit"
 
s.source_files = "NewsApp_Network/**/*.{swift}"
#s.dependency 'Alamofire'
 
 
s.swift_version = "5.5"
 
end
