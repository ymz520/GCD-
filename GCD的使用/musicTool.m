//
//  musicTool.m
//  GCD的使用
//
//  Created by 张 荣桂 on 16/9/26.
//  Copyright © 2016年 张 荣桂. All rights reserved.
//

#import "musicTool.h"

@interface musicTool ()

@end

@implementation musicTool

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//懒加载:(保持对象只分配一次内存)
-(NSMutableArray *)musics{
    if(!_musics){
        _musics=[[NSMutableArray alloc]initWithCapacity:0];
    }
    return _musics;
}

//第一步：定义一个全局变量（来保存）
    id _musictools;
//第二步：重写父类的分配内存空间的方法，在其里面拦截内存的分配，让他只分配一次
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
// 第三步：枷锁   @synchronized的作用：防止多线程又重复创建（它的作用是枷锁，让其同步执行，只执行一次）
    @synchronized(_musictools) {
        if (!_musictools) {
            _musictools=[super allocWithZone:zone];
        }
        return _musictools;
    }
}
+(instancetype)sharemusicTool{
    return [[self alloc]init];
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
