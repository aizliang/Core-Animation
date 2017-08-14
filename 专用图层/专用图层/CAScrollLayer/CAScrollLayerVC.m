//
//  CAScrollLayerVC.m
//  专用图层
//
//  Created by ai on 17/5/3.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "CAScrollLayerVC.h"
#import "CAScrollView.h"

@interface CAScrollLayerVC ()
@property (weak, nonatomic) IBOutlet CAScrollView *scrollLayerView;
@end

@implementation CAScrollLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.frame = self.scrollLayerView.bounds;
    [_scrollLayerView addSubview:imageView];
    // Do any additional setup after loading the view.
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
