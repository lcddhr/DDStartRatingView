## 前言

最近做的在线客服聊天需要用到星星评分控件,记得之前做电影票订购的练习项目的时候用到过星星评分控件,但是没有封装成独立的类，今天就索性抽点时间把控件封装好，提高开发效率。
原理其实很简单

 * 绘制上下两层星，获取点击星星的坐标，然后改变上层的frame，这样上下两层就能产生视觉差。


## 效果
![](http://iosddimage.qiniudn.com/git_DDStartRatingView.gif)

##如何使用
（1）初始化控件
```
    [[DDStartRatingView alloc] initWithFrame:CGRectMake(20, 30, 280, 260) delegate:self];

```
（2）实现代理方法
```
    -(void)starRatingView:(DDStartRatingView *)view touchIndex:(int)index
```




## TODO

（1）目前只做了5个星星的评价,以后可以做成可定制的，根据传入的个数自动生成星星。
（2）目前只能整数个星星的评价，以后可以做成根据手指的滑动，按比例显示星星，也可以实现打分效果。

##感谢
感谢开源项目[TQStarRatingView](https://github.com/TinyQ/TQStarRatingView)的作者[TinyQ](https://github.com/TinyQ)。

博客: [http://www.liuchendi.com](http://www.liuchendi.com)
