# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

# !!Note!!
# As ConfiantSDK is private, you need to set sources.
source 'https://cdn.cocoapods.org/'
source 'https://cdn.confiant-integrations.net/backend-integrations/in-app/releases/ios/podspecs.git'

target 'IntegrationExample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for IntegrationExample
  # Without Gravite and Confiant Plugin
  # pod 'YieldloveAdIntegration', :podspec => 'https://slabs-yieldlove-ad-integration.s3.eu-central-1.amazonaws.com/ios/YieldloveAdIntegration.podspec'
  
  # Pods for IntegrationExample
  # with Gravite and Confiant Plugin
  pod 'ConfiantSDK', '6.1.0'
  pod 'AATKit', '3.10.8'
  pod 'YieldloveAdIntegration', :podspec => 'https://slabs-yieldlove-ad-integration.s3.eu-central-1.amazonaws.com/ios/YieldloveAdIntegration.podspec', subspecs: ['Confiant', 'Gravite']

  
  #with only Gravite Plugin
  #pod 'AATKit', '3.10.8'
  #pod 'YieldloveAdIntegration', :podspec => 'https://slabs-yieldlove-ad-integration.s3.eu-central-1.amazonaws.com/ios/YieldloveAdIntegration.podspec', subspecs: ['Gravite']
  
  #with only Confiant Plugin
  #pod 'ConfiantSDK', '6.1.0'
  #pod 'YieldloveAdIntegration', :podspec => 'https://slabs-yieldlove-ad-integration.s3.eu-central-1.amazonaws.com/ios/YieldloveAdIntegration.podspec', subspecs: ['Confiant']
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
