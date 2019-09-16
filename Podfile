platform :ios, '12.4'

def rx_swift
  pod 'RxSwift', '~> 5.0'
end

def rx_cocoa
  pod 'RxCocoa', '~> 5.0'
end

target 'BlueCoding' do
  use_frameworks!
  rx_cocoa
  rx_swift

  target 'BlueCodingTests' do
    inherit! :search_paths
  end

end

target 'DataPlatform' do
  use_frameworks!
  rx_swift
  pod 'RxAlamofire'
  pod 'RxRealm'

  target 'DataPlatformTests' do
    inherit! :search_paths
  end

end

target 'Domain' do
  use_frameworks!
  rx_swift

  target 'DomainTests' do
    inherit! :search_paths
  end

end
