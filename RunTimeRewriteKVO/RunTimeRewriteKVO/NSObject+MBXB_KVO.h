//
//  NSObject+MBXB_KVO.h
//  RunTimeRewriteKVO
//
//  Created by Oboe_b on 2017/9/7.
//  Copyright © 2017年 MBXB-bifujian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MBXB_KVO)

- (void)MBXB_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
@end
