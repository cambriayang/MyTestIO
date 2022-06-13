source 'https://github.com/CocoaPods/Specs.git'

require 'fileutils'

@target_version = '10.0'

platform :ios, @target_version

inhibit_all_warnings!


#Have serveral targets may need this 'def'
def common_pods
    pod 'Masonry'
end

def debug_pods
    pod 'FLEX', :configurations => ['Debug']
    # pod 'MLeaksFinder', :configurations => ['Debug']
    # pod 'FBRetainCycleDetector'
end

def umenTest
    pod 'UMCCommon'
    pod 'UMCAnalytics'
    pod 'UMCSecurityPlugins'
end

def sd_web_image
    pod 'SDWebImage'
    pod 'SDWebImage/WebP'
end




def app_pods
    common_pods
    debug_pods
#    umenTest
end

target 'MyTestIO' do
  #flutter_application_path = './my_flutter'
  #load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

  #对于每个需要集成Flutter的Podfile target，添加如下内容
  #install_all_flutter_pods(flutter_application_path)
  MYFLUTTER_FOLDER = 'myflutter'
  
  if File.exist?(MYFLUTTER_FOLDER)
    then `rm -rf #{MYFLUTTER_FOLDER}`
  end
  
#   `git clone https://github.com/cambriayang/myflutter.git`
#   flutter_application_path = __dir__ + "/#{MYFLUTTER_FOLDER}"
  
#  unless Flie.exist?(MYFLUTTER_FOLDER)
#    raise "ERROR: 找不到文件夹#{MYFLUTTER_FOLDER}"
#  end
  
#   FileUtils.cd MYFLUTTER_FOLDER
#   `flutter build ios > /dev/tty`
     
  # 如果想要调试本地的 Flutter 工程，就把下面这行注释放开
  # flutter_application_path = "xxx/xxx/my_flutter"
  
#   eval(File.read(File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')), binding)
  
  app_pods
  
  #Can add individual pods
end


### HOOK POST
pre_install do |installer|
    def installer.verify_no_static_framework_transitive_dependencies; end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_STRICT_OBJC_MSGSEND'] = 'NO'
            config.build_settings['ENABLE_BITCODE'] = 'NO'
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = @target_version
        end
    end
end
