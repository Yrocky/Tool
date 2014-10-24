//
//  MPImageView.m
//  YR1021MusicPlayer
//
//  Created by YeungRocky on 14-10-21.
//  Copyright (c) 2014年 YeungRocky. All rights reserved.
//

#import "MPImageView.h"

#define kB 15

@implementation MPImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
//        self.alpha = 0.7;
    }
    return self;
}

- (void)setImage:(UIImage *)image{

    _image = image;
    
    // 这个方法必须调用
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    CGPoint origin =  CGPointMake(kB, kB);
    CGSize size = CGSizeMake(w - 2 * kB, h - 2 * kB);
    CGRect imageRect = (CGRect){origin,size};
    
    CGContextRef comm = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(comm);

    CGContextSetLineWidth(comm, kB);
    CGContextSetStrokeColorWithColor(comm, [UIColor colorWithRed:0.5 green:0.1 blue:0.1 alpha:0.1].CGColor);
    CGContextAddEllipseInRect(comm, imageRect);
    
    CGContextStrokePath(comm);
    
    CGContextRestoreGState(comm);
    
    
    CGContextAddEllipseInRect(comm, imageRect);
    CGContextClip(comm);
    CGContextFillPath(comm);
    [self.image drawInRect:imageRect];
    
    CGContextStrokePath(comm);
}


@end
