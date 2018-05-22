//
//  UITextField+Activity.m
//  TxtWithActivity
//
//  Created by Mac on 2018/5/22.
//  Copyright © 2018年 saint. All rights reserved.
//

#import "UITextField+Activity.h"
#import <objc/runtime.h>

static NSString * activityKey  = @"activity";
static NSString * rgtViewKey   = @"rgtViewKey";


@interface UITextField ()
// 用于替换rightView
@property (nonatomic, strong) UIView * rgtView;

@end

@implementation UITextField (Activity)

#pragma mark - runtime 添加属性

-(void)setActivity:(UIActivityIndicatorView *)activity {
    objc_setAssociatedObject(self, &activityKey, activity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView *)activity {
    return objc_getAssociatedObject(self, &activityKey);
}

-(void)setRgtView:(UIView *)rgtView {
    objc_setAssociatedObject(self, &rgtViewKey, rgtView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)rgtView {
    return objc_getAssociatedObject(self, &rgtViewKey);
}

-(void)SX_startAnimating {
    self.rgtView = self.rightView;
    self.rightView = ({
        if (!self.activity) {
            self.activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            [self.activity setFrame:CGRectMake(0, 0, 30, 30)];
        }
        self.activity;
    });
    self.rightViewMode = UITextFieldViewModeAlways;
    [self.activity  startAnimating];
}

-(void)SX_stopAnimating {
    [self.activity stopAnimating];
    self.rightView = self.rgtView;
}

-(BOOL)SX_isAnimating {
    return [self.activity isAnimating];
}

@end
