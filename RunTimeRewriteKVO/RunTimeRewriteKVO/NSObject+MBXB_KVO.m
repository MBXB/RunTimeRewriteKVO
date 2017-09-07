//
//  NSObject+MBXB_KVO.m
//  RunTimeRewriteKVO
//
//  Created by Oboe_b on 2017/9/7.
//  Copyright © 2017年 MBXB-bifujian. All rights reserved.
//

#import "NSObject+MBXB_KVO.h"
#import <objc/message.h>
@implementation NSObject (MBXB_KVO)
- (void)MBXB_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    //动态生成一个类
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newName = [@"NSMBXB_" stringByAppendingString:oldClassName];
    const char * newClassName = [newName UTF8String];
    //定义
    Class MBXBClass = objc_allocateClassPair([self class], newClassName, 0);
    class_addMethod(MBXBClass, @selector(setName:), (IMP)setName, "v@:@");
    //注册
    objc_registerClassPair(MBXBClass);
    //指向
    object_setClass(self, MBXBClass);
    //绑定
    objc_setAssociatedObject(self, (__bridge const void *)@"123", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
}
void setName(id self,SEL _cmd,NSString * newName){
   
    id class = [self class];
    object_setClass(self, class_getSuperclass([self class]));
    objc_msgSend(self, @selector(setName:),newName);
    id observer = objc_getAssociatedObject(self, (__bridge const void *)@"123");
    objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:),self,@"name",@{@"new":newName},nil);
    object_setClass(self, class);
    
}
@end
