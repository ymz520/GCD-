//
//  ViewController.m
//  GCD的使用
//
//  Created by 张 荣桂 on 16/9/25.
//  Copyright © 2016年 张 荣桂. All rights reserved.
//

#import "ViewController.h"
#import "musicTool.h"
#import "eViewController.h"
typedef void (^MyBlock) ();
typedef int (^numBlock)(int,int);
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self blockExample];
//    [self blockExampleTwo];
    [self singletonExample];
}
//单例的例子
-(void)singletonExample{
//    [UIApplication sharedApplication]
//    采用单例的情况，内存地址不一样
//    一般单例模式都会提供一个shared方法，代表这个类是共享的
    musicTool *tool=[musicTool shareinstance];
     musicTool *tool1=[musicTool shareinstance];
    eViewController *e1=[eViewController shareinstance];
    eViewController *e2=[eViewController shareinstance];
    NSLog(@"%p,%p,%p,%p",tool,tool1,e1,e2);
//    copy,如果你想copy，copy内部也会调用内部的copy方法

}
//无形参无返回值
-(void)blockExample{
//    定义block变量，并初始化
//     void (^firstBlock) ()=^(){
//    NSLog(@"这是一个无形参无返回值");
//};
    MyBlock firstBlock;
    firstBlock=^(){
        NSLog(@"这是一个无形参无返回值");
    };
//   block的调用
    firstBlock();
}
//有形参有返回值
-(void)blockExampleTwo{
    //    定义block
// int (^secondBlock)(int,int)=^(int a,int b){
//        return a+b;
// };
    numBlock secondBlock=^(int a,int b){
        return a+b;
    };
    //   block的调用
  int result=secondBlock(10,11);
    NSLog(@"这是一个有形参有返回值的block，返回值：%d",result);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self gcdTest4];
}
//串行同步
-(void)gcdTest1{
//    1.创建一个串行队列
//    1。1属性：队列标签，1.2:队列属性
//    gcd是纯c语言所有不能加@
//  DISPATCH_QUEUE_SERIAL:  #define DISPATCH_QUEUE_SERIAL NULL
//  dispatch_queue_t queue=dispatch_queue_create("aa", DISPATCH_QUEUE_SERIAL);
     dispatch_queue_t queue=dispatch_queue_create("aa", NULL);
    for (int i=0; i<10; i++) {
        //    2.将任务放到队列中执行（）
        //    2.1:参数1，你创建的队列；参数2:你要执行的任务
        dispatch_sync(queue, ^{
            NSLog(@"%d,=====%@",i,[NSThread currentThread]);
        });
    }

}
//串行异步
-(void)gcdTest2{
    dispatch_queue_t queue=dispatch_queue_create("aa", DISPATCH_QUEUE_SERIAL);
    for (int i=0; i<10; i++) {
        //    2.将任务放到队列中执行（）
        //    2.1:参数1，你创建的队列；参数2:你要执行的任务
        dispatch_async(queue, ^{
            NSLog(@"%d,=====%@",i,[NSThread currentThread]);
        });
    }
    

}
//并行队列异步
-(void)gcdTest3{
//    CONCURRENT:并发，创建并发队列
    dispatch_queue_t queue=dispatch_queue_create("aa", DISPATCH_QUEUE_CONCURRENT);
//    执行任务
    for (int i=0; i<10; i++) {
        //    2.将任务放到队列中执行（）
        //    2.1:参数1，你创建的队列；参数2:你要执行的任务
        dispatch_async(queue, ^{
            NSLog(@"%d,=====%@",i,[NSThread currentThread]);
        });
    }
    

}
//并行队列同步执行
-(void)gcdTest4{
    //    CONCURRENT:并发，创建并发队列
    dispatch_queue_t queue=dispatch_queue_create("aa", DISPATCH_QUEUE_CONCURRENT);
    //    执行任务
    for (int i=0; i<10; i++) {
        //    2.将任务放到队列中执行（）
        //    2.1:参数1，你创建的队列；参数2:你要执行的任务
        dispatch_sync(queue, ^{
            NSLog(@"%d,=====%@",i,[NSThread currentThread]);
        });
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
