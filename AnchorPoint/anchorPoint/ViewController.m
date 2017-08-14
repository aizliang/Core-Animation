//
//  ViewController.m
//  anchorPoint
//
//  Created by ai on 17/4/11.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "ViewController.h"
#import "ZPositionVC.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.redView = [[UIView alloc] init];
    _redView.clipsToBounds = YES;
    _redView.frame = CGRectMake(100, 100, 100, 100);
    _redView.backgroundColor = [UIColor blueColor];
    _redView.layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view addSubview:_redView];
    NSLog(@"frame:%@, bounds:%@,center:%@",NSStringFromCGRect(_redView.frame) ,NSStringFromCGRect(_redView.bounds) ,NSStringFromCGPoint(_redView.center));

    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)resetAnchorPoint:(id)sender {
    _redView.layer.anchorPoint = CGPointMake(0.5, 0.5);
}

- (IBAction)changeAnchorPoint:(id)sender {
    _redView.layer.anchorPoint = CGPointMake(0, 0);
    NSLog(@"frame:%@, bounds:%@,center:%@",NSStringFromCGRect(_redView.frame) ,NSStringFromCGRect(_redView.bounds) ,NSStringFromCGPoint(_redView.center));
}


- (IBAction)rotation:(id)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        _redView.transform = CGAffineTransformRotate(_redView.transform, M_PI / 30);
    }];

}


- (IBAction)resetTimer:(id)sender {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}


- (IBAction)toZPosition:(id)sender {
    ZPositionVC *zPotision = [[ZPositionVC alloc] init];
    [self presentViewController:zPotision animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
