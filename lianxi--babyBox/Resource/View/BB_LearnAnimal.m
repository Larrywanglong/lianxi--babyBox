//
//  BB_LearnAnimal.m
//  lianxi--babyBox
//
//  Created by 王龙 on 15/12/16.
//  Copyright © 2015年 王龙. All rights reserved.
//

#import "BB_LearnAnimal.h"

@implementation BB_LearnAnimal



- (void)setList:(NSArray *)list{
    if ([_list isEqualToArray:list]) {
        
        return;
    }
    
    _list = list;
    
    self.contentSize = CGSizeMake((_list.count+2)*SCREEN_WIDTH+100, 0);
//    self.pagingEnabled = YES;
    for (int i=0; i<_list.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((SCREEN_WIDTH+100)*i, 100, SCREEN_WIDTH, SCREEN_WIDTH);
        [button setBackgroundImage:[UIImage imageNamed:_list[i]] forState:UIControlStateNormal];
        [button setTitle:_list[i] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
        [self addSubview:button];
        
        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}

- (void)action:(UIButton *)sender{
    NSString *title = [sender titleForState:UIControlStateHighlighted];
    NSLog(@"%@",title);
}


@end
