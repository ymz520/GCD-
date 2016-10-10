//
//  eViewController.m
//  GCD的使用
//
//  Created by 张 荣桂 on 16/9/29.
//  Copyright © 2016年 张 荣桂. All rights reserved.
//

#import "eViewController.h"

@interface eViewController ()

@end

@implementation eViewController

//第一步，定义一个全局的静态变量，来保持该类的实例
static id _instance;
//当类加载到内存中，就会调用一次
+(void)load{
    _instance=[[self alloc]init];
}
//单例实现的三个方法
//2.当你copy一个对象时的分配空间
-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}
//1.重写分配内存空间的方法
#pragma mark-重写父类里分配内存的方法，
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
// GCD中的dispatch_once保证了方法只执行一次
    dispatch_once(&onceToken, ^{
         _instance=[super allocWithZone:zone];
    });
    return _instance;
}
+(instancetype)shareinstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance=[[self alloc]init];
    });
    return _instance;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
