class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @controller = UIViewController.alloc.initWithNibName(nil, bundle:nil)
    @window.rootViewController = @controller
    @window.makeKeyAndVisible
    true
  end
end
