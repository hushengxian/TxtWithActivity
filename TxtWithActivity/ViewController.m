//
//  ViewController.m
//  TxtWithActivity
//
//  Created by Mac on 2018/5/22.
//  Copyright © 2018年 saint. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+Activity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITextField * txt = [[UITextField alloc] initWithFrame:CGRectMake(0, 100,[UIScreen mainScreen].bounds.size.width - 40, 40)];
    txt.placeholder = @"    textField添加活动指示器";
    txt.leftView = ({
        UILabel * lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        lbl.textColor = [UIColor grayColor];
        lbl.font = [UIFont systemFontOfSize:15];
        lbl.textAlignment = NSTextAlignmentRight;
        lbl.text = @"左边";
        lbl;
    });
    
    txt.rightView = ({
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        img.image = [UIImage imageNamed:@"next"];
        img;
    });
    
    txt.leftViewMode   = UITextFieldViewModeAlways;
    txt.rightViewMode  = UITextFieldViewModeAlways;
    
    [self.view addSubview:txt];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [txt SX_startAnimating];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [txt SX_stopAnimating];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
