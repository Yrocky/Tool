//
//  NSString+FrameHeight.m
//  QYWeiBoClient
//
//  Created by qingyun on 14-9-28.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "NSString+FrameHeight.h"

@implementation NSString (FrameHeight)

//算法思路：
//根据指定的视图的宽度，和指定的字体大小，计算字符串所占的高度（单位：像素)
//字符串的总宽度 / 控件每一行显示的宽度 得到需要显示的行数 ，
//得到每一行显示的高度
//行数＊高度 就是返回的总高度

- (CGFloat)frameHeightWithFontSize:(CGFloat)fontSize forViewWidth:(CGFloat)width
{
//    字符串的总宽度
    NSDictionary *attributs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGSize size = [self sizeWithAttributes:attributs];
//    显示的行数
//    每一行显示的字数，使用控件的宽度 / 字体的大小
    NSUInteger wordsPerLine =  floor(width / fontSize);
//    每一行显示宽度 字体大小＊每一行显示的字数
    CGFloat widthPerLine = fontSize * wordsPerLine;
//   字符串的总宽度 / 每一行显示的宽度
    NSUInteger numLines = ceil( size.width / widthPerLine);
//    根据每一行的高度(size.height)，计算总高度
    CGFloat height = numLines * size.height;
    return height;
}
@end
