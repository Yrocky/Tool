//
//  UIImage+waterImage.h
//  YR1003绘画基础
//
//  Created by Rocky on 14-10-3.
//  Copyright (c) 2014年 Rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (waterImage)
+ (UIImage*) logoImageWithImageName:(NSString *)imageName logoImageName:(NSString *)logoName;


+ (UIImage *) logoImageWithImageName:(NSString *)imageName logoString:(NSString *)logoString;
@end
