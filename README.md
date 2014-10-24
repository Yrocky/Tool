Tool
====


MPImageView
===
自定义图片视图，根据QuartzCore在View中进行绘制image，具有和系统一样的使用方法

NSString+FrameHeight
===
根据指定的视图的宽度，和指定的字体大小，计算字符串所占的高度（单位：像素)
字符串的总宽度 / 控件每一行显示的宽度 得到需要显示的行数 ，
得到每一行显示的高度
行数＊高度 就是返回的总高度制

NSString+Size
====
根据字符串的内容计算出字符串的尺寸大小，内容的最大尺寸宽度是一个界定好的值，高度没有限制(MAXFLOT)

NSString+TimeGap
====
根据时间字符串内容通过一定的时间个格式计算出与当前时间的时间差

UIImage+Resize
====
通过传进来的图片进行拉伸，采用平铺拉伸，输出一个UIImage对象

UIImage+WaterImage
====
通过绘制，在一个图片上绘制出想要的水印，达到新浪微博用户发送图片自带用户ID的功能

YRFocusView
====
通过UIScrollView和NSTimer在UIView中进行图片的自动滚动，外带解决了当用户进行拖动的时候出现的bug
