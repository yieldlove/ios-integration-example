# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

source 'https://cdn.cocoapods.org/'
source 'https://cdn.confiant-integrations.net/backend-integrations/in-app/releases/ios/podspecs.git'

target 'SimpleAdTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # For Confiant
  pod 'ConfiantSDK', '6.1.1'
  pod 'YieldloveAdIntegration', :podspec => 'https://slabs-yieldlove-ad-integration.s3.eu-central-1.amazonaws.com/ios/YieldloveAdIntegrationConfiant.podspec', subspecs: ['Gravite', 'Confiant']
  
  # For Gravite
  pod 'AATKit', '3.10.8'
  # pod 'YieldloveAdIntegration/Gravite', '9.10.0'
  pod 'YieldloveConsent', '6.5.0'

  

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
