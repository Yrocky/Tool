//
//  YRFocusView.h
//  YR1024ClassDemo
//
//  Created by YoungRocky on 14-10-24.
//  Copyright (c) 2014年 YoungRocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YRFocusView : UIView

- (id)initWithFrme:(CGRect)frame withImages:(NSArray *)images;

- (void) startTimer;

@property (nonatomic ,retain) NSArray *images;

@end
