//
//  YRFocusView.m
//  YR1024ClassDemo
//
//  Created by YoungRocky on 14-10-24.
//  Copyright (c) 2014年 YoungRocky. All rights reserved.
//

#import "YRFocusView.h"


#define kTimerRepeatTime 2.0f
#define kScrollViewAnimationTime 2.0f

@interface YRFocusView ()<UIScrollViewDelegate>

@property (nonatomic ,retain) UIScrollView *scrollView;
@property (nonatomic ,assign) CGFloat frameW;
@property (nonatomic ,assign) CGFloat frameH;
@property (nonatomic ,assign) NSInteger imagesCount;
@property (nonatomic ,retain) NSTimer *timer;

@end
@implementation YRFocusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
/**
 *  自定义初始化方法，将传进来的图片名字数组重新进行布局
 *
 *  @param frame  视图的frame
 *  @param images 图片名字数组
 *
 *  @return 返回一个具有重新排列图片，并且将图片添加到scrollView上的自定义视图
 */
- (id)initWithFrme:(CGRect)frame withImages:(NSArray *)images{
    
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableArray *tempArray = [NSMutableArray array];
        [tempArray addObject:[images lastObject]];// 这个是为了防止用户在第一个图片的时候进行ScrollView的滚动，报漏出来最左边没有东西的事实
        [tempArray addObjectsFromArray:images];
        [tempArray addObject:[images firstObject]];// 在最右边添加一个一开始就展示的图片的原因和上面的是一样的
        self.images = tempArray;
        
        _imagesCount = self.images.count;
        _frameW = frame.size.width;
        _frameH = frame.size.height;
        
    }
    return self;
}
/**
 *    对图片进行排列
 */
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    CGFloat imageW = _frameW;
    CGFloat imageH = _frameH;
    CGFloat imageY = 0;
    CGFloat imageX ;
    
    for (int index = 0; index < _imagesCount; index ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.images[index]]];
        imageX = index * imageW;
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        [_scrollView addSubview:imageView];
    }
    _scrollView.contentSize = CGSizeMake(imageW * _imagesCount, imageH);
    [self addSubview:_scrollView];
    CGPoint startContentOffset = CGPointMake(imageW, 0);
    
    // 一开始将展示的图片设置为传进来的数组中的第一个，不能要动画
    [_scrollView setContentOffset:startContentOffset animated:NO];
    
}

/**
 *  设置定时器，进行scrollView的滚动
 */
- (void) startTimer{
    
    if (!self.timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:kTimerRepeatTime target:self selector:@selector(autoScroll:) userInfo:nil repeats:YES];
    }
}
/**
 *  scrollView的定时器滚动方法
 *
 *  @param timer 定时器
 */
- (void) autoScroll:(NSTimer *)timer{
    
    CGPoint point = CGPointZero;
    
    if (self.scrollView.contentOffset.x >= (_imagesCount - 1)* _frameW) {// 当scrollView滚到了最后面的一个图片，将他的contentOffset设置为最开始的位置
        
        point = CGPointMake(_frameW, 0);
        // 这里的动画效果一定要关了，不然达不到需要的效果
        [self.scrollView setContentOffset:point animated:NO];
    }
    
    point = CGPointMake(self.scrollView.contentOffset.x + _frameW, 0);
    [UIView animateWithDuration:kScrollViewAnimationTime animations:^{
        [self.scrollView setContentOffset:point animated:YES];
    }];
}

/**
 *   停止定时器
 */
- (void) stopTimer{
    
    // 将定时器的所有重置，然后进行滞空
    [_timer invalidate];
    _timer = nil;
}

#pragma mark - scrollView的Delegate方法

/**
 *  scrollView结束拖拽的时候调用将定时器打开
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [self startTimer];
}

/**
 *  scrollView开始拖拽的时候将定时器停止
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self stopTimer];
}
#pragma mark - 由于在真正的第一张图片显示的时候也是可以进行拖拽的，但是一拖拽就会出现bug，暴漏了最右边或者最左边的图片的存在，
/**
 *  使用scrollView的另一个代理方法，scrollViewDidScroll：进行判断，
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGPoint point = CGPointZero;
    
    if (scrollView.contentOffset.x > _frameW * (_imagesCount - 1)) {// 当滑动到最右边的时候，将scrollView的contentOffset设置为真正的第一张图片的位置
        point = CGPointMake(_frameW, 0);
        [scrollView setContentOffset:point animated:NO];
    }
    
    if (scrollView.contentOffset.x < 0) {// 当滑动到最左边的时候，将scrollView的contentOffset设置为真正的最后一个图片的位置
        point = CGPointMake(_frameW * (_imagesCount - 1), 0);
        [scrollView setContentOffset:point animated:NO];
    }
}

@end
