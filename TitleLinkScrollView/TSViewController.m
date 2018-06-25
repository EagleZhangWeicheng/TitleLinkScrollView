//
//  TSViewController.m
//  TitleLinkScrollView
//
//  Created by Mac on 2018/6/25.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "TSViewController.h"

@interface TSViewController ()

@end

@implementation TSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
-(NSInteger)numberSectionInTitleLinkScorllView:(TitleLinkScrollView *)titleScrollView{
    return 10;
}

-(UIViewController*)titleLinkScrollView:(TitleLinkScrollView *)titleLinkScrollView cellforSection:(NSInteger)section{
    UIViewController *d1  = [[UIViewController alloc] init];
    CGFloat r = (section * 10 + 10)%255 /255.0;
    CGFloat g = (section * 30 + 30)%255 /255.0;
    CGFloat b = (section * 60 + 60)%255 /255.0;
    d1.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    return d1;

}

-(NSString*)titleLinkScrollView:(TitleLinkScrollView*)titleLinkScrollView titleforSection:(NSInteger)section;{
    return [NSString stringWithFormat:@"继承%ld",section];
}

@end
