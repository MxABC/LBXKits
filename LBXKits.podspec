Pod::Spec.new do |s|
    s.name         = 'LBXKits'
    s.version      = '0.1.1'
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
      sss.source_files = 'LBXKits/Utils/Gps/**/*.{h,m}'
      end

      ss.subspec 'LBXDevice' do |sss|
      sss.source_files = 'LBXKits/Utils/LBXDevice/**/*.{h,m}'
      end

      ss.subspec 'Encryption' do |sss|
      sss.source_files = 'LBXKits/Utils/Encryption/**/*.{h,m}'
      end

      ss.subspec 'Permissions' do |sss|
      sss.source_files = 'LBXKits/Utils/Permissions/**/*.{h,m}'
      end

      ss.subspec 'Regular' do |sss|
      sss.source_files = 'LBXKits/Utils/Regular/**/*.{h,m}'
      end
    end

    s.subspec 'Categorys' do |ss|
      ss.source_files = 'LBXKits/Categorys/*.{h,m}'
      ss.subspec 'MBProgressHUD' do |sss|
       sss.dependency 'MBProgressHUD', '~> 0.9.2'
       sss.source_files = 'LBXKits/Categorys/MBProgressHUD/*.{h,m}'
       sss.resource     = 'LBXKits/Categorys/MBProgressHUD/MBProgressHUD.bundle'
      end

    end


end
