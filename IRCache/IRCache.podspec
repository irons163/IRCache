Pod::Spec.new do |spec|
  spec.name         = "IRCache"
  spec.version      = "1.0.0"
  spec.summary      = "A powerful cache of iOS."
  spec.description  = "A powerful cache of iOS."
  spec.homepage     = "https://github.com/irons163/IRCache.git"
  spec.license      = "MIT"
  spec.author       = "irons163"
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/irons163/IRCache.git", :tag => spec.version.to_s }
  spec.source_files  = "IRCache/**/*.{h,m}"
end