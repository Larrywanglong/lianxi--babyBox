//
//  BB_LearnDetailViewController.m
//  lianxi--babyBox
//
//  Created by 王龙 on 15/12/16.
//  Copyright © 2015年 王龙. All rights reserved.
//

#import "BB_LearnDetailViewController.h"
#import "BB_LearnShapeView.h"
#import "BB_LearnNumberView.h"
#import "BB_LearnAnimal.h"


#define BUTTON_WIDTH  SCREEN_WIDTH/3
@interface BB_LearnDetailViewController ()
{
    NSMutableArray *dataList;
    UIScrollView *scrollerView;
    BB_LearnShapeView *shapeView;
    BB_LearnNumberView *numberView;
    BB_LearnAnimal *animalView;
}
@end

@implementation BB_LearnDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
   
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
    [self showViews];
}

- (void)loadData{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"BabyBox" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    NSArray *keys =@[@"Learn_ColorList",@"Learn_ShapeList",@"Learn_NumberList",@"learn_AnimalList"];
    
    NSArray *detail = dic[keys[self.type-100]];
    
    dataList = [detail copy];
}


- (void)createColorView{
    
    scrollerView = [[UIScrollView alloc]initWithFrame:SCREEN_BOUNDS];
    scrollerView.contentSize = CGSizeMake(0, BUTTON_WIDTH*(dataList.count+4));
    [self.view addSubview:scrollerView];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-10)/2, 50, 10, BUTTON_WIDTH*(dataList.count+3)-50)];
    view.backgroundColor = [UIColor colorWithRed:0.232 green:0.845 blue:0.314 alpha:1.000];
    [scrollerView addSubview:view];
    
    
    for (int i=0; i<dataList.count; i++) {
        NSDictionary *dic = dataList[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setTitle:dic.allKeys[0] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
        button.frame = CGRectMake(BUTTON_WIDTH, 50+(BUTTON_WIDTH+50)*i, BUTTON_WIDTH, BUTTON_WIDTH);
        NSString *content = dic.allValues[0];
        
        NSArray *color = [content componentsSeparatedByString:@","];
        
        button.backgroundColor = [UIColor colorWithRed:[color[0] floatValue] green:[color[1] floatValue] blue:[color[2] floatValue] alpha:[color[3] floatValue]];
        
        button.layer.cornerRadius = BUTTON_WIDTH/2;
        [scrollerView addSubview:button];
        
        
        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    

}

//按钮的触发事件
- (void)action:(UIButton *)sender{
    NSString *colorName = [sender titleForState:UIControlStateHighlighted];
    NSLog(@"%@",colorName);
    
}


- (void)showViews{
    
    switch (self.type) {
        case LearnColor:{
            self.title = @"识颜色";
            [self createColorView];
            break;
        }
        case LearnShape:{
            self.title = @"识形状";
            [self createShapeView];
            break;
        }
        case LearnNumber:{
            self.title = @"识数字";
            [self createNumberView];
            break;
        }
        case LearnAnimal:{
            self.title = @"识动物";
            [self createAnimalView];
            break;
        }

        default:
            break;
    }
}

// 形状视图
- (void)createShapeView{
    if (shapeView != nil) {
        return;
    }
    
    
    shapeView = [[BB_LearnShapeView alloc]initWithFrame:SCREEN_BOUNDS];
    
    shapeView.list = dataList;
    
    [self.view addSubview:shapeView];
    
}
- (void)createNumberView{
    
    if (numberView != nil) {
        return;
    }
    numberView = [[BB_LearnNumberView alloc]initWithFrame:SCREEN_BOUNDS];
    
    numberView.list = dataList;
    
    [self.view addSubview:numberView];
    
}


- (void)createAnimalView{
    if (animalView != nil) {
        return;
    }
    
    animalView = [[BB_LearnAnimal alloc]initWithFrame:SCREEN_BOUNDS];
    animalView.list = dataList;
    [self.view addSubview:animalView];
    
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
