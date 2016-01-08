Pod::Spec.new do |s|
    s.name         = 'LBXKits'
    s.version      = '0.1.0'
    s.summary      = 'common use code kits'
    s.homepage     = 'https://github.com/MxABC'
    s.license      = 'MIT'
    s.authors      = {'lbxia' => 'lbxia20091227@foxmail.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/MxABC/LBXKits.git', :tag => s.version}
    s.requires_arc = true
    s.prefix_header_contents = '#import <Foundation/Foundation.h>'

    s.subspec 'Utils' do |ss|
      ss.subspec 'Gps' do |sss|
      sss.source_files = 'Utils/Gps/**/*.{h,m}'
      end

      ss.subspec 'LBXDevice' do |sss|
      sss.source_files = 'Utils/LBXDevice/**/*.{h,m}'
      end

      ss.subspec 'Encryption' do |sss|
      sss.source_files = 'Utils/Encryption/**/*.{h,m}'
      end

      ss.subspec 'Permissions' do |sss|
      sss.source_files = 'Utils/Permissions/**/*.{h,m}'
      end

      ss.subspec 'Regular' do |sss|
      sss.source_files = 'Utils/Regular/**/*.{h,m}'
      end
    end

    s.subspec 'Categorys' do |ss|
      s.source_files = 'Utils/Categorys/*.{h,m}'
      ss.subspec 'MBProgressHUD' do |sss|
      sss.dependency 'MBProgressHUD', '~> 0.9.2'
      sss.source_files = 'Utils/Categorys/MBProgressHUD/*.{h,m}'
      sss.resource     = 'Utils/Categorys/MBProgressHUD/MBProgressHUD.bundle'
      end

    end


end
