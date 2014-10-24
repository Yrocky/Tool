//
//  UIImage+waterImage.m
//  YR1003绘画基础
//
//  Created by Rocky on 14-10-3.
//  Copyright (c) 2014年 Rocky. All rights reserved.
//

#import "UIImage+waterImage.h"

#define  kFont 25

@implementation UIImage (waterImage)

+ (UIImage*) logoImageWithImageName:(NSString *)imageName logoImageName:(NSString *)logoName{

    UIImage *bgImage = [UIImage imageNamed:imageName];
    
    UIGraphicsBeginImageContextWithOptions(bgImage.size, YES, 0.0);
    
    CGFloat bgImageW = bgImage.size.width;
    CGFloat bgImageH = bgImage.size.height;
    
    [bgImage drawInRect:CGRectMake(0, 0, bgImageW, bgImageH)];
    
    CGFloat scale = 0.1;
    CGFloat margin = 3;
    CGFloat logoW = bgImageW * scale;
    CGFloat logoH = bgImageH * scale;
    CGFloat logoX = bgImageW - logoW - margin;
    CGFloat logoY = bgImageH - logoH - margin;
    UIImage *logoImage = [UIImage imageNamed:logoName];
    
    [logoImage drawInRect:CGRectMake(logoX, logoY, logoW, logoH)];
    
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    
    return newImage;
}

+ (UIImage *) logoImageWithImageName:(NSString *)imageName logoString:(NSString *)logoString{
    UIImage *bgImage = [UIImage imageNamed:imageName];
    
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    CGFloat bgImageW = bgImage.size.width;
    CGFloat bgImageH = bgImage.size.height;
    
    [bgImage drawInRect:CGRectMake(0, 0, bgImageW, bgImageH)];
    
    
    NSString *string = [NSString stringWithFormat:@"@%@",logoString];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:kFont];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    CGSize logoSize = [string sizeWithAttributes:dict];
    CGFloat margin = 15;
    CGFloat logoW = logoSize.width;
    CGFloat logoH = kFont + 10;
    CGFloat logoX = bgImageW - logoW - margin;
    CGFloat logoY = bgImageH - logoH - margin;
    
    [string drawInRect:CGRectMake(logoX, logoY, logoW, logoH) withAttributes:dict];
    
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    
    return newImage;

    
}
@end
