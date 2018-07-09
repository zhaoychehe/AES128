Pod::Spec.new do |s|

s.name         = "AES128"
s.version      = "1.0"
s.summary      = "AES passord"
s.homepage     = "https://github.com/zhaoychehe/AES128.git"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "YC_ToTo" => "zhaoychehe@163.com" }
s.platform     = :ios, "9.0"
s.source       = { :git => "https://github.com/zhaoychehe/AES128.git", :tag => "1.0" }
s.source_files = "AESLib/*"
s.framework    = "UIKit"
s.requires_arc = true

# s.resources = "KKSwiftHUD/*.png" 图片资源

# s.frameworks = "SomeFramework", "AnotherFramework"

end