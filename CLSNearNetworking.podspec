Pod::Spec.new do |s|

    s.name         = "CLSNearNetworking"
    s.version      = "1.0.0"
    s.summary      = "A short description of CLSNearNetworking."
    s.description  = <<-DESC
                    Cc
                   DESC

    s.homepage     = "https://github.com/shutefeng/CLSNearNetworking"
  
    s.license      = { :type => 'Copyright', :text =>
        <<-LICENSE
        Copyright 2010-2015 CenterC Inc.
        LICENSE
    }
  
    s.author             = { "TT" => "654974034@qq.com" }

    s.source       = { :git => "https://github.com/shutefeng/CLSNearNetworking.git", :tag => "#{s.version}" }

    s.source_files  = "Classes", "Classes/**/*.{swift}"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


    s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

    s.framework = "UIKit"
  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

    s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
