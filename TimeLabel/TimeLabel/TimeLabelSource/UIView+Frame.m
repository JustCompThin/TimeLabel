//
//  UIView+Frame.m
//  TimeLabel
//
//  Created by coolead on 2017/12/12.
//  Copyright © 2017年 JustCompareThin. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
- (void)setMkX:(CGFloat)xValue {
    CGRect frame = self.frame;
    frame.origin.x = xValue;
    self.frame = frame;
}//

- (CGFloat)mkX {
    return self.frame.origin.x;
}//

- (void)setMkY:(CGFloat)yValue {
    CGRect frame = self.frame;
    frame.origin.y = yValue;
    self.frame = frame;
}//

- (CGFloat)mkY {
    return self.frame.origin.y;
}//

- (void)setMkWidth:(CGFloat)widthValue {
    CGRect frame = self.frame;
    frame.size.width = widthValue;
    self.frame = frame;
}//

- (CGFloat)mkWidth {
    return self.frame.size.width;
}//

- (void)setMkHeight:(CGFloat)heightValue {
    CGRect frame = self.frame;
    frame.size.height = heightValue;
    self.frame = frame;
}//

- (CGFloat)mkHeight {
    return self.frame.size.height;
}//

- (void)setMkMaxX:(CGFloat)MaxX
{
    CGRect frame = self.frame;
    frame.origin.x = ceilf(MaxX-frame.size.width);
    self.frame = frame;
}//

- (CGFloat)mkMaxX
{
    return self.frame.origin.x + self.frame.size.width;
}//

- (void)setMkMaxY:(CGFloat)MaxY
{
    CGRect frame = self.frame;
    frame.origin.y = ceilf(MaxY-frame.size.height);
    self.frame = frame;
}//

- (CGFloat)mkMaxY
{
    return self.frame.origin.y + self.frame.size.height;
}//

- (void)setMkCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}//

- (void)setMkCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}//

- (CGFloat)mkCenterX {
    return self.center.x;
}//

- (CGFloat)mkCenterY {
    return self.center.y;
}//

- (CGFloat)mkBoundWidth
{
    return self.bounds.size.width;
}//

- (CGFloat)mkBoundHeight
{
    return self.bounds.size.height;
}

- (CGSize)mkSize {
    return self.frame.size;
}

- (void)setMkSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)mkBottom{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setMkBottom:(CGFloat)bottom{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)mkRight{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setMkRight:(CGFloat)mkRight{
    CGRect frame = self.frame;
    frame.origin.x = mkRight - frame.size.width;
    self.frame = frame;
}
@end
