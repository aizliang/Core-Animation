//
//  Transition.m
//  显示动画
//
//  Created by ai on 17/6/1.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "Transition.h"

@interface Transition ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, assign) NSInteger index;
@end

@implementation Transition

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageNames = @[@"鲨鱼",@"鹿鹿",@"火烈鸟"];
    self.imageView.image = [UIImage imageNamed:self.imageNames[0]];
    self.index = 0;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeImage:(id)sender {
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromTop;
    [self.imageView.layer addAnimation:transition forKey:nil];
    
    
    self.index++;
    NSInteger currentIndex = self.index % self.imageNames.count;
    self.imageView.image = [UIImage imageNamed:self.imageNames[currentIndex]];
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
