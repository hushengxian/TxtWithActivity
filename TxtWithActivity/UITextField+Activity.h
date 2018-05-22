//
//  UITextField+Activity.h
//  TxtWithActivity
//
//  Created by Mac on 2018/5/22.
//  Copyright © 2018年 saint. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Activity)

@property (nonatomic, strong) UIActivityIndicatorView * activity;

-(void)SX_startAnimating;

-(void)SX_stopAnimating;

-(BOOL)SX_isAnimating;

@end
