//
//  ZPositionVCViewController.m
//  anchorPoint
//
//  Created by ai on 17/4/12.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "ZPositionVC.h"

@interface ZPositionVC ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *greenView;

@property (nonatomic, assign) BOOL showRedView;
@end

@implementation ZPositionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(50, 50, 50, 25);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *changeZPosition = [[UIButton alloc] init];
    changeZPosition.frame = CGRectMake(150, 150, 50, 25);
    [changeZPosition setTitle:@"changeZ" forState:UIControlStateNormal];
    [changeZPosition setBackgroundColor:[UIColor blueColor]];
    [changeZPosition addTarget:self action:@selector(changeZ) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeZPosition];
    

    // Do any additional setup after loading the view.
}


- (void)changeZ {
    self.showRedView = !self.showRedView;
    if (self.showRedView) {
        self.redView.layer.zPosition = 0.1;
        self.greenView.layer.zPosition = 0.0;
    } else {
        self.redView.layer.zPosition = 0.0;
        self.greenView.layer.zPosition = 0.1;
    }
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
