Pod::Spec.new do |s|
    s.name         = "LBCollectionsCombinerView"
    s.version      = "0.0.6"
    s.summary      = "LBCollectionsCombinerView: Lioz Balki Animate Framework"
    
    s.description  = <<-DESC
                   The Lioz Balki SDK for iOS Collections Combiner View framework provides:
                   *
                   DESC
    
    s.homepage  = "https://github.com/lioz12131415/LBCollectionsCombinerView.git"
    s.readme    = "https://raw.githubusercontent.com/lioz12131415/LBCollectionsCombinerView/main/README.md"
    
    s.license = {
        :type => "MIT", :file => "LICENSE"
    }
    s.author = {
        "Lioz Balki" => "lioz12131415@gmail.com"
    }
    s.source = {
        :git => "https://github.com/lioz12131415/LBCollectionsCombinerView.git", :tag => "#{s.version}"
    }
    s.resource_bundles = {
        'LBCollectionsCombinerView' => ['LBCollectionsCombinerView/**/*.{swift,xcassets,xcdatamodeld,ttf}']
    }
    s.pod_target_xcconfig = {
        'LD_RUNPATH_SEARCH_PATHS' => '$(FRAMEWORK_SEARCH_PATHS)'
    }
    
    s.source_files = "LBCollectionsCombinerView", "LBCollectionsCombinerView/**/*.{h,m,swift,folder,storyboard,strings,xcdatamodeld,xib,ttf}"
    
    s.platform               = :ios, "14.0"
    s.libraries              = 'z'
    s.requires_arc           = true
    s.swift_version          = "5.0"
    s.vendored_frameworks    = "_LBCollectionsCombinerViewXCFramework.xcframework"
    s.ios.deployment_target  = '14.0'

end
