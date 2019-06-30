Pod::Spec.new do |s|
  s.name         = "Tokui"
  s.version      = "0.1"
  s.summary      = "Simple Tutorial screen that lights items."
  s.description  = <<-DESC
                    - Simple Tutorial screen that lights items.

                    - Written in Swift :)
                   DESC

  s.homepage     = "https://github.com/YuigaWada/Tokui"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Yuiga Wada" => "yuigawada@gmail.com" }
  s.social_media_url   = "https://twitter.com/YuigaWada"
  s.source       = { :git => "https://github.com/YuigaWada/Tokui.git", :tag => s.version }
  s.source_files  = "Tokui/**/*.swift"
  s.requires_arc = true
  s.swift_version = '5.0'
  s.platform     = :ios, '11.0'
  s.resources    = 'Tokui/**/*.xib'
end