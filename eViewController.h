//
//  eViewController.h
//  GCD的使用
//
//  Created by 张 荣桂 on 16/9/29.
//  Copyright © 2016年 张 荣桂. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PrefixHeader.pch"
//使用GCD来实现单例模式
@interface eViewController : UIViewController
+(instancetype)shareinstance;

@end
