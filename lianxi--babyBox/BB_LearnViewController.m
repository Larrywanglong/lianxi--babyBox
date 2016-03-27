//
//  BB_LearnViewController.m
//  lianxi--babyBox
//
//  Created by 王龙 on 15/12/16.
//  Copyright © 2015年 王龙. All rights reserved.
//

#import "BB_LearnViewController.h"
#import "BB_LearnDetailViewController.h"

@interface BB_LearnViewController ()
{
    NSMutableArray *dataList;
}
@end

@implementation BB_LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
//    去除导航栏的高度
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self loadData];
    [self createButton];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self randeButton];
    
}

//读取数据
- (void)loadData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"BabyBox" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    dataList = dic[@"Learn_Home"];
    
}

- (void)createButton{
    UIImage *image = [UIImage imageNamed:@"treasure"];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:SCREEN_BOUNDS];
    scrollView.contentSize = CGSizeMake(0, (dataList.count+1)*image.size.height);
    [self.view addSubview:scrollView];
    
    
    for (int i=0; i<dataList.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:dataList[i] forState:UIControlStateNormal];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [scrollView addSubview:button];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.showsTouchWhenHighlighted = YES;
        button.titleLabel.font = [UIFont boldSystemFontOfSize:25];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.tag = 100+i;
        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    
}
//  给按钮随机位置
- (void)randeButton{
    for (int i=0; i<dataList.count; i++) {
        UIImage *image = [UIImage imageNamed:@"treasure"];
        UIButton *button = [self.view viewWithTag:100+i];
        
        int rand =arc4random()%(int)(SCREEN_WIDTH-(image.size.width+50))+50;
        button.frame = CGRectMake(rand, 50+(image.size.height+10)*i, image.size.width, image.size.height);
    }
    
    
}

//按钮的触发事件
- (void)action:(UIButton *)sender{
    BB_LearnDetailViewController *detail = [[BB_LearnDetailViewController alloc]init];
    
    detail.type = sender.tag;
    
    [self.navigationController pushViewController:detail animated:YES];
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
