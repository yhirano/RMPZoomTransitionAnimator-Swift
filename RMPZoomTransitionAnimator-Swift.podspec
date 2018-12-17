Pod::Spec.new do |s|
  s.name          = "RMPZoomTransitionAnimator-Swift"
  s.version       = "2.0"
  s.summary       = "A custom zooming transition animation for UIViewController."
  s.homepage      = "https://github.com/yhirano/RMPZoomTransitionAnimator-Swift/"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.author        = { "Yuichi Hirano" => "chirano@uraroji.com" }
  s.platform      = :ios, "10.0"
  s.source        = { :git => "https://github.com/yhirano/RMPZoomTransitionAnimator-Swift.git", :tag => "#{s.version}" }
  s.source_files  = "RMPZoomTransitionAnimator-Swift/*.swift"
  s.swift_version = "4.2"
  s.requires_arc = true
end
