//
//  TitleLinkScrollViewController.m
//  TopButtonAddScrollview
//
//  Created by Mac on 2018/6/22.
//  Copyright © 2018年 Mac. All rights reserved.
//
#define TSSafeAreaTopHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 88 : 64)


#import "TitleLinkScrollViewController.h"
#import "Data1ViewController.h"
@interface TitleLinkScrollViewController ()<TitleLinkScrollViewDataSource>

@end

@implementation TitleLinkScrollViewController


-(void)initSet{
    if (self.titleLinkScrollView == nil) {
        self.titleLinkScrollView = [[TitleLinkScrollView alloc] initWithFrame:CGRectMake(0, TSSafeAreaTopHeight, self.view.frame.size.width, self.view.frame.size.height - TSSafeAreaTopHeight)];
        self.titleLinkScrollView.dataSource = self;
        [self.titleLinkScrollView reloadData];
    }
    
    if (self.titleHeight != 0 ) {
        self.titleLinkScrollView.titleHeight = self.titleHeight;
    }
    
    if (self.titleShowCount != 0) {
        self.titleLinkScrollView.titleShowCount = self.titleShowCount;
    }

    if (self.titleSelectColor != nil) {
        self.titleLinkScrollView.titleSelectColor = self.titleSelectColor;
    }
    
    if (self.titleNomalColor != nil) {
        self.titleLinkScrollView.titleNomalColor = self.titleNomalColor;
    }

    if (self.titleSelectColor != nil) {
        self.titleLinkScrollView.titleSplitLineColor = self.titleSelectColor;
    }
    
    if (self.titleIdentifyColor != nil) {
        self.titleLinkScrollView.titleIdentifyColor = self.titleIdentifyColor;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"viewdidlaod");
    [self initSet];
//    NSLog(@"self.titleLinkScrollView  viewDidLoad %@",self.titleLinkScrollView);
    [self.view addSubview:self.titleLinkScrollView];
//    [self.titleLinkScrollView reloadData];
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

-(NSInteger)numberSectionInTitleLinkScorllView:(TitleLinkScrollView*)titleScrollView; //所有数量
{
    return 20;
}

-(UIViewController*)titleLinkScrollView:(TitleLinkScrollView*)titleLinkScrollView cellforSection:(NSInteger)section;
{
//    NSLog(@"dddddd");
//    UIViewController *d1  = [[UIViewController alloc] init];
    Data1ViewController *d1 = [[Data1ViewController alloc] init];
//    CGFloat r = rand()%255 /255.0;
//    CGFloat g = rand()%255 /255.0;
//    CGFloat b = rand()%255 /255.0;
//    d1.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    NSLog(@"init viewcontroller %@ section %ld",d1,section);
    return d1;
}

-(NSString*)titleLinkScrollView:(TitleLinkScrollView*)titleLinkScrollView titleforSection:(NSInteger)section;{
    NSLog(@"section title %ld ",section);
    return [NSString stringWithFormat:@"%ld",section+100];
}


@end
