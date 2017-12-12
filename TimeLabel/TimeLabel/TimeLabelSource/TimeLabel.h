//
//  TimeLabel.h
//  TimeLabel
//
//  Created by coolead on 2017/12/12.
//  Copyright © 2017年 JustCompareThin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TimeType){
    TIME_HOUR_MINUTE_SECOND,
    TIME_HOUR_MINUTE
};

typedef NS_ENUM(NSInteger,TimeDisplayMode){
    TIME_DISPLAY_MODE_NORMAL,
    TIME_DISPLAY_MODE_COUNT_DOWN
};

@interface TimeLabel : UIView

-(instancetype)initWityFrame:(CGRect)frame type:(TimeType)type timeChange:(void(^)(NSInteger time))timeChange timeEnd:(void(^)(void))timeEnd;

-(void)setcurentTime:(NSInteger)curentTime;

@end
