//
//  TimeLabel.m
//  TimeLabel
//
//  Created by coolead on 2017/12/12.
//  Copyright © 2017年 JustCompareThin. All rights reserved.
//

#import "TimeLabel.h"
#import "UIView+Frame.h"
#import "TimeNumberView.h"

#define kTimeHeight         50
#define kTimeWidth          30

@interface TimeLabel()

@property(nonatomic,assign)NSInteger type;
@property(nonatomic,assign)NSInteger number;
@property(nonatomic,copy)void(^change)(NSInteger);
@property(nonatomic,copy)void(^end)(void);
@property(nonatomic,strong)NSTimer *timer;

@property(nonatomic,strong)TimeNumberView *hourH;
@property(nonatomic,strong)TimeNumberView *hourL;

@property(nonatomic,strong)TimeNumberView *minuteH;
@property(nonatomic,strong)TimeNumberView *minuteL;

@property(nonatomic,strong)TimeNumberView *secondH;
@property(nonatomic,strong)TimeNumberView *secondL;

@end


@implementation TimeLabel

- (instancetype)initWityFrame:(CGRect)frame type:(TimeType)type timeChange:(void (^)(NSInteger))timeChange timeEnd:(void (^)(void))timeEnd{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        self.type = type;
        self.change = timeChange;
        self.end = timeEnd;
        
        CGFloat px = width;
        CGFloat py = (height - kTimeHeight) * 0.5;
        
        if (self.type == TIME_HOUR_MINUTE_SECOND) {
            px -= 20;
            
            UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(px, py, 20, kTimeHeight)];
            secondLabel.textAlignment = NSTextAlignmentCenter;
            secondLabel.text = @"秒";
            secondLabel.font = [UIFont systemFontOfSize:15];
            secondLabel.textColor = [UIColor lightGrayColor];
            [self addSubview:secondLabel];
            
            px -= kTimeWidth;
            self.secondL = [[TimeNumberView alloc] initWithFrame:CGRectMake(px, py, kTimeWidth, kTimeHeight) maxNumber:9];
            [self addSubview:self.secondL];
   
            px -= kTimeWidth;
            px -= 1;
            
            self.secondH = [[TimeNumberView alloc] initWithFrame:CGRectMake(px, py, kTimeWidth, kTimeHeight) maxNumber:5];
            [self addSubview:self.secondH];

        }
        
        px -= 20;
        
        UILabel *minuteLabel = [[UILabel alloc] initWithFrame:CGRectMake(px, py, 20, kTimeHeight)];
        minuteLabel.textAlignment=NSTextAlignmentCenter;
        minuteLabel.text=@"分";
        minuteLabel.font=[UIFont systemFontOfSize:15];
        minuteLabel.textColor=[UIColor lightGrayColor];
        [self addSubview:minuteLabel];
        
        px -= kTimeWidth;
        self.minuteL = [[TimeNumberView alloc] initWithFrame:CGRectMake(px, py, kTimeWidth, kTimeHeight) maxNumber:9];
        [self addSubview:self.minuteL];
        
        px -= (kTimeWidth + 1);
        self.minuteH = [[TimeNumberView alloc] initWithFrame:CGRectMake(px, py, kTimeWidth, kTimeHeight) maxNumber:5];
        [self addSubview:self.minuteH];
        px -= 20;
        
        UILabel *hourLabel = [[UILabel alloc]initWithFrame:CGRectMake(px, py, 20, kTimeHeight)];
        hourLabel.textAlignment=NSTextAlignmentCenter;
        hourLabel.text=@"时";
        hourLabel.font=[UIFont systemFontOfSize:15];
        hourLabel.textColor=[UIColor lightGrayColor];
        [self addSubview:hourLabel];
        
        px -= kTimeWidth;
        self.hourL=[[TimeNumberView alloc]initWithFrame:CGRectMake(px, py, kTimeWidth, kTimeHeight) maxNumber:9];
        [self addSubview:self.hourL];
        px -= 1;
        px -= kTimeWidth;
        self.hourH = [[TimeNumberView alloc]initWithFrame:CGRectMake(px, py, kTimeWidth, kTimeHeight) maxNumber:5];
        [self addSubview:self.hourH];
    }
    return self;
}

- (void)setcurentTime:(NSInteger)curentTime{
    if (curentTime<=0) {
        return;
    }
    if (curentTime >= 24*60*60) {
        return;
    }
    self.number = curentTime;
    NSInteger hour = curentTime/3600;
    NSInteger hourLeft = hour/10;
    NSInteger hourRight=hour%10;
    [self.hourH setCurentNumber:hourLeft];
    [self.hourL setCurentNumber:hourRight];
    
    curentTime -= hour*3600;
    NSInteger minute = curentTime/60;
    NSInteger minuteLeft = minute/10;
    NSInteger minuteRight = minute%10;
    [self.minuteH setCurentNumber:minuteLeft];
    [self.minuteL setCurentNumber:minuteRight];
    
    
    if (self.type == TIME_HOUR_MINUTE_SECOND) {
        curentTime -= minute * 60;
        NSInteger secondLeft = curentTime/10;
        NSInteger secondRight = curentTime%10;
        [self.secondH setCurentNumber:secondLeft];
        [self.secondL setCurentNumber:secondRight];
    }
    
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(numberChange) userInfo:nil repeats:YES];
}

-(void)numberChange{
    self.number--;
    if (self.number<=0) {
        if (self.end) {
            self.end();
        }
        [self.timer invalidate];
        self.timer=nil;
    }else{
        if (self.change) {
            self.change(self.number);
        }
    }
    NSInteger curentTime=self.number;
    NSInteger hour=curentTime/3600;
    NSInteger hourLeft=hour/10;
    NSInteger hourRight=hour%10;
    if (self.hourH.curentNumber!=hourLeft) {
        [self.hourH numberChange];
    }
    if (self.hourL.curentNumber!=hourRight) {
        [self.hourL numberChange];
    }
    
    
    curentTime-=hour*3600;
    NSInteger minute=curentTime/60;
    NSInteger minuteLeft=minute/10;
    NSInteger minuteRight=minute%10;
    if (self.minuteH.curentNumber!=minuteLeft) {
        [self.minuteH numberChange];
    }
    if (self.minuteL.curentNumber!=minuteRight) {
        [self.minuteL numberChange];
    }
    
    
    if (self.type==TIME_HOUR_MINUTE_SECOND) {
        curentTime-=minute*60;
        NSInteger secondLeft=curentTime/10;
        NSInteger secondRight=curentTime%10;
        if (self.secondH.curentNumber!=secondLeft) {
            [self.secondH numberChange];
        }
        if (self.secondL.curentNumber!=secondRight) {
            [self.secondL numberChange];
        }
    }
}

-(void)dealloc{
    if (self.timer) {
        [self.timer invalidate];
        self.timer=nil;
    }
}

@end
