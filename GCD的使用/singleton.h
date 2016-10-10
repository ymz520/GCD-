//
//  singleton.h
//  GCD的使用
//
//  Created by 张 荣桂 on 16/10/10.
//  Copyright © 2016年 张 荣桂. All rights reserved.
//


/* singleton_h */
#define singletonH +(instancetype)shareinstance;
#define singletonM \
\
static  id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone\
{\static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance=[super allocWithZone:zone];\
    });\
    return _instance;\
}\
+(instancetype)shareinstance{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance=[[self alloc] init];\
    });\
    \
    return _instance;\
}
