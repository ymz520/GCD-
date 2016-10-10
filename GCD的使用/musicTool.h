//
//  musicTool.h
//  GCD的使用
//
//  Created by 张 荣桂 on 16/9/26.
//  Copyright © 2016年 张 荣桂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface musicTool : UIViewController
@property(nonatomic,strong)NSMutableArray*musics;
//instancetype:实例类型；
//第四步：为了方便的调用
+(instancetype)shareinstance;
@end
