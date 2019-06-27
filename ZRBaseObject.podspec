Pod::Spec.new do |s|

  s.name         = "ZRBaseObject"
  s.version      = "0.0.5"
  s.summary      = "基础组件"
  s.description  = <<-DESC
                    基础组件，初始化等等
                   DESC

  s.homepage     = "https://dazhongge.com"
  s.license      = "MIT"
  s.author       = { "Rogue" => "619455850@qq.com" }
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/RogueAndy/ZRBaseObject.git", :tag => "#{s.version}" }

  s.source_files  = "ZRBaseObject/*", "ZRBaseObject/Category/*", "ZRBaseObject/Tool/*" 
  s.public_header_files = "ZRBaseObject/*.h", "ZRBaseObject/Category/*.h", "ZRBaseObject/Tool/*.h"

  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
