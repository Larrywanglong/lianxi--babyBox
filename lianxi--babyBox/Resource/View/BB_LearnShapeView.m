//
//  BB_LearnShapeView.m
//  lianxi--babyBox
//
//  Created by 王龙 on 15/12/16.
//  Copyright © 2015年 王龙. All rights reserved.
//

#import "BB_LearnShapeView.h"

@implementation BB_LearnShapeView


- (void)setList:(NSArray *)list{
    if ([_list isEqualToArray: list]) {
        return;
    }
    
    _list = list;
    
      self.contentSize = CGSizeMake(0, (_list.count+1)*SCREEN_WIDTH/2);
       for (int i=0; i<_list.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setBackgroundImage:[UIImage imageNamed:_list[i]] forState:UIControlStateNormal];
        [button setTitle:_list[i] forState:UIControlStateHighlighted];
           button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
           button.titleLabel.textColor = [UIColor blackColor];
         button.frame = CGRectMake(SCREEN_WIDTH/4, 50+(SCREEN_WIDTH/2)*i, SCREEN_WIDTH/2, SCREEN_WIDTH/2);
        [self addSubview:button];
           
           [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
    }
    
    
}

- (void)action:(UIButton *)sender{
    NSString *title = [sender titleForState:UIControlStateHighlighted];
    NSLog(@"%@",title);
    
}



@end
