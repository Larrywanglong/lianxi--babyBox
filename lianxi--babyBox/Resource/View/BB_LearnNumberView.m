//
//  BB_LearnNumberView.m
//  lianxi--babyBox
//
//  Created by 王龙 on 15/12/16.
//  Copyright © 2015年 王龙. All rights reserved.
//

#import "BB_LearnNumberView.h"

@implementation BB_LearnNumberView


- (void)setList:(NSArray *)list{
    if ([_list isEqualToArray:list]) {
        
        return;
    }
    _list = list;
    
    UIImage *image = [UIImage imageNamed:@"1"];
    self.contentSize = CGSizeMake(0, (_list.count+5)*image.size.height);
    
    for (int i=0; i<_list.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:_list[i]] forState:UIControlStateNormal];
        button.frame = CGRectMake((SCREEN_WIDTH-image.size.width)/2, (image.size.height+80)*i, image.size.width, image.size.height);
        [button setTitle:_list[i] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [self addSubview:button];
        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    
}

- (void)action:(UIButton *)sender{
    NSString *title = [sender titleForState:UIControlStateHighlighted];
    NSLog(@"%@",title);
    
}


@end
