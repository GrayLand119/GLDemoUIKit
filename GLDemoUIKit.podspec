Pod::Spec.new do |spec|
  spec.name         = "GLDemoUIKit"
  spec.version      = "0.0.2"
  spec.summary      = "A Lite UIKit For Demos."
  spec.description  = <<-DESC
  A Lite UIKit For write demos quickly.
                   DESC

  spec.homepage     = "https://github.com/GrayLand119/GLDemoUIKit"
  spec.license      = "MIT"
  spec.author       = { "GrayLand" => "441726442@qq.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/GrayLand119/GLDemoUIKit.git", :tag => spec.version }
  spec.source_files = "GLDemoUIKit/GLDemoUIKit/**/*.{h,m,swift}"
  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  spec.frameworks = 'UIKit','Foundation'
  spec.dependency "PKHUD", "~> 5.3.0"
  spec.dependency "SnapKit", "~> 5.0.1"
  spec.dependency "YYCategories", "~> 1.0.4"

end
