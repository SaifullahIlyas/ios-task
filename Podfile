platform :ios, '12.1'
use_frameworks!
inhibit_all_warnings!

target 'CampaignBrowser' do
    pod 'RxSwift', '= 5.1.1'
    pod 'RxCocoa', '= 5.1.1'
    pod 'MapleBacon', '= 4.0.1'
    target 'CampaignBrowserTests' do
           inherit! :search_paths
           pod 'RxSwift', '= 5.1.1'
           pod 'RxCocoa', '= 5.1.1'
          ## pod 'MapleBacon', '= 4.0.1'
       end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if ['MapleBacon'].include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
end
