//
//  UIView+Frame.h
//  TimeLabel
//
//  Created by coolead on 2017/12/12.
//  Copyright © 2017年 JustCompareThin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat mkX;
@property (nonatomic, assign) CGFloat mkY;
@property (nonatomic, assign) CGFloat mkWidth;
@property (nonatomic, assign) CGFloat mkHeight;
@property (nonatomic, assign) CGFloat mkMaxX;
@property (nonatomic, assign) CGFloat mkMaxY;
@property (nonatomic, assign) CGFloat mkCenterX;
@property (nonatomic, assign) CGFloat mkCenterY;
@property (nonatomic, assign, readonly) CGFloat mkBoundWidth;
@property (nonatomic, assign, readonly) CGFloat mkBoundHeight;

@property (nonatomic) CGSize mkSize;

@property (nonatomic) CGFloat mkBottom;

@property (nonatomic) CGFloat mkRight;

@end
