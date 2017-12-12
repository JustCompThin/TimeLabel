//
//  TimeNumberView.m
//  TimeLabel
//
//  Created by coolead on 2017/12/12.
//  Copyright © 2017年 JustCompareThin. All rights reserved.
//

#import "TimeNumberView.h"

@interface TimeNumberView()

@property(nonatomic,strong)UILabel *label0;

@property(nonatomic,strong)UILabel *label1;

@property(nonatomic,assign)NSInteger maxNumber;

@end


@implementation TimeNumberView

- (instancetype)initWithFrame:(CGRect)frame maxNumber:(NSInteger)maxNumber{
    if (self = [super initWithFrame:frame]) {
       
        self.maxNumber = maxNumber;
        
        CGFloat w=frame.size.width;
        CGFloat h=frame.size.height;
        
        self.contentSize=CGSizeMake(w, h*2);
        self.contentOffset=CGPointMake(0, h);
        self.showsVerticalScrollIndicator=NO;
        self.showsHorizontalScrollIndicator=NO;
        self.backgroundColor=[UIColor blackColor];
        self.layer.cornerRadius=2;
        self.scrollEnabled=NO;
        
        self.label0=[[UILabel alloc]initWithFrame:CGRectMake(0, h, w, h)];
        self.label0.textAlignment=NSTextAlignmentCenter;
        self.label0.font=[UIFont systemFontOfSize:15];
        self.label0.textColor=[UIColor whiteColor];
        [self addSubview:self.label0];
        self.label0.text=@"0";
        
        self.label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, w, h)];
        self.label1.textAlignment=NSTextAlignmentCenter;
        self.label1.font=[UIFont systemFontOfSize:15];
        self.label1.textColor=[UIColor whiteColor];
        [self addSubview:self.label1];
        self.label1.text=@"0";
        
    }
    return self;
}

- (void)setCurentNumber:(NSInteger)curentNumber{
    _curentNumber = curentNumber;
    
    if (curentNumber <= self.maxNumber && curentNumber >= 0 ) {
        self.label0.text=[NSString stringWithFormat:@"%ld",(long)curentNumber];
        NSInteger next=curentNumber-1;
        if (next<0) {
            next=self.maxNumber;
        }
        self.label1.text=[NSString stringWithFormat:@"%ld",(long)next];
    }
}

-(void)numberChange{
    [UIView animateWithDuration:0.5 animations:^{
        self.contentOffset=CGPointMake(0, 0);
    } completion:^(BOOL finished) {
        self.curentNumber--;
        if (self.curentNumber<0) {
            self.curentNumber=self.maxNumber;
        }
        self.label0.text=[NSString stringWithFormat:@"%ld",(long)self.curentNumber];
        self.contentOffset=CGPointMake(0, self.frame.size.height);
        NSInteger next=self.curentNumber-1;
        if (next<0) {
            next=self.maxNumber;
        }
        self.label1.text=[NSString stringWithFormat:@"%ld",(long)next];
    }];
}

@end
