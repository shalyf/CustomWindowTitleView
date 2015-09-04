# CustomWindowTitleView

在Mac中自定义NSWindow的标题栏其实很简单，在OS X 10.10之前，我们可以通过简单的两行代码来搞定：

```objective-c
NSView *themeView = [window.contentView superview];
[themeView addSubview:self.viewCustom positioned:NSWindowBelow relativeTo:nil];
```

但是在Yosemite以后，运行以上代码，会得到一段警告：

`NSWindow warning: adding an unknown subview: <NSView: 0x608000120fa0>. Break on NSLog to debug.`

虽然目前并不会影响程序的执行，但是对于有点洁癖的人来说，看到这段警告还是很不爽的，那么在Yosemite我们要怎么避免这个错误而实现我们的目的呢？

根据警告内容，我们知道themeView不能添加未知的view，通过themeView的subviews，可以知道它包含了两个view，一个就是window的contentView，而另外一个是NSTitleBarContainerView，这个view就是window的标题栏，可以看到他的高度刚好是22。那我们要自定义titleView，就要通过NSTitleBarContainerView来做文章了，但是这个view只局限在NSWindow标题栏那小小22高度的地方，怎么让他铺满整个window呢，可以通过NSTitlebarAccessoryViewController来解决。

```objective-c
NSTitlebarAccessoryViewController *vc = [[NSTitlebarAccessoryViewController alloc] init];
vc.view = [[NSView alloc] initWithFrame:((NSView *)window.contentView).frame];
[window addTitlebarAccessoryViewController:vc];
        
NSView *containerView = themeView.subviews[1];
[containerView addSubview:self.viewCustom positioned:NSWindowBelow relativeTo:nil];
```

新建一个NSTitlebarAccessoryViewController，填充一个大小和contentView刚好的view，然后通过window的addTitlebarAccessoryViewController方法添加到window中。这时候我们再去看themeView下的两个子view，发现contentView的高度变成0，而NSTitleBarContainerView的高度变成了window的高度了，这样我们的目的就达到了，接着我们把自定义的view添加到titleView中，但是发现我们自定义的view是半透明的样子，这时候只要把window的titlebarAppearsTransparent设置为YES就可以了。
