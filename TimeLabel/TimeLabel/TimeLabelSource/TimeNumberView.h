//
//  TimeNumberView.h
//  TimeLabel
//
//  Created by coolead on 2017/12/12.
//  Copyright © 2017年 JustCompareThin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeNumberView : UIScrollView

-(instancetype)initWithFrame:(CGRect)frame maxNumber:(NSInteger)maxNumber;

@property(nonatomic,assign)NSInteger curentNumber;

-(void)numberChange;
@end
