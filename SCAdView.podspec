Pod::Spec.new do |s|
  s.name         = 'SCAdView'
  s.version      = '0.6'
  s.summary      = '一个支持2D平面 , 3D缩放 , 上下左右方向滚动 , 有限/无限循环 轮播的轮播控件 A carousel control which support the vertical or horizontal scrolling direction, finite / infinite loop carousel , with both 2D plane effect or 3D zoom effect'
  s.homepage     = 'https://github.com/Chan4iOS/SCAdView'
  s.author       = "CT4 => 284766710@qq.com"
  s.source       = {:git => 'https://github.com/Chan4iOS/SCAdView.git', :tag => "#{s.version}"}
  s.source_files = "SCAdView/**/*.{h,m}"
  s.requires_arc = true
  s.libraries = 'z'
  s.ios.deployment_target = '8.0'
  s.license = 'MIT'
  s.frameworks = 'UIKit'
end
