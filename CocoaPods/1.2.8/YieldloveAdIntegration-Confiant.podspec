Pod::Spec.new do |spec|
  spec.name               = 'YieldloveAdIntegration'
  spec.version            = '1.2.8'
  spec.summary            = 'A lightweight SDK that helps publishers maximize ad revenue across mobile websites and apps.'
  spec.license            = {
    :type => 'Commercial',
    :file => 'yieldlove-ad-integration-1.2.8/YieldloveAdIntegration/LICENSE'
  }
  spec.description        = 'We provide publishers with a platform that maximizes ad monetization, ensuring every impression is optimized for top-tier revenue performance.'
  spec.homepage           = 'https://yieldlove.com/'
  spec.documentation_url  = 'https://stroeerdigitalgroup.atlassian.net/wiki/x/FgGyc'
  spec.author             = {
    'Stroeer Labs' => 'stroeerlabs@adscale.co.nz'
  }
  spec.source             = {
    :http => 'https://raw.githubusercontent.com/mbrtargeting/stroeerSDK-iOS-spm/main/CocoaPods/1.2.8/yieldlove-ad-integration-1.2.8.zip'
  }

  spec.requires_arc       = true
  spec.platforms          = { :ios => '15.0' }
  spec.static_framework   = true
  spec.swift_version      = '5.0'

  spec.default_subspecs = 'Core'

  spec.subspec 'Core' do |core|
    core.vendored_frameworks = [
      'yieldlove-ad-integration-1.2.8/YieldloveAdIntegration/Frameworks/YieldloveAdIntegration.xcframework'
    ]

    core.resource_bundles = {
      'YieldloveAdIntegration' => [
        'yieldlove-ad-integration-1.2.8/YieldloveAdIntegration/Resources/Core/dashboard.html',
        'yieldlove-ad-integration-1.2.8/YieldloveAdIntegration/Resources/Core/debuginfo.html',
        'yieldlove-ad-integration-1.2.8/YieldloveAdIntegration/Resources/Core/PrivacyInfo.xcprivacy'
      ]
    }

    core.dependency 'PrebidMobile', '3.3.1'
    core.dependency 'Google-Mobile-Ads-SDK', '13.7.0'
  end

  spec.subspec 'Consent' do |consent|
    consent.vendored_frameworks = [
      'yieldlove-ad-integration-1.2.8/YieldloveAdIntegration/Frameworks/YieldloveAdIntegration_Consent.xcframework'
    ]

    consent.resource_bundles = {
      'YieldloveAdIntegrationConsent' => [
        'yieldlove-ad-integration-1.2.8/YieldloveAdIntegration/Resources/Consent/PrivacyInfo.xcprivacy'
      ]
    }

    consent.dependency 'YieldloveAdIntegration/Core'
    consent.dependency 'ConsentViewController', '~>7.12'
  end

  spec.subspec 'Confiant' do |confiant|
    confiant.vendored_frameworks = [
      'yieldlove-ad-integration-1.2.8/YieldloveAdIntegration/Frameworks/YieldloveAdIntegration_Confiant.xcframework'
    ]

    confiant.dependency 'YieldloveAdIntegration/Core'
    confiant.dependency 'ConfiantSDK', '6.1.4'
  end
end
