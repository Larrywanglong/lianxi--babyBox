//
//  BB_LearnDetailViewController.h
//  lianxi--babyBox
//
//  Created by 王龙 on 15/12/16.
//  Copyright © 2015年 王龙. All rights reserved.
//

#import "BB_BaseViewController.h"

typedef NS_ENUM(NSUInteger, LearnType) {
    LearnColor = 100,
    LearnShape,
    LearnNumber,
    LearnAnimal
};

@interface BB_LearnDetailViewController : BB_BaseViewController

@property (nonatomic,assign) LearnType type;

@end
