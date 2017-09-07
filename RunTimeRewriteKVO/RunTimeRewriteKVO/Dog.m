//
//  Dog.m
//  RunTimeRewriteKVO
//
//  Created by Oboe_b on 2017/9/7.
//  Copyright © 2017年 MBXB-bifujian. All rights reserved.
//

#import "Dog.h"

@implementation Dog
- (void)setName:(NSString *)name{
    _name = [NSString stringWithFormat:@"%@%@",name,@"普拉达"];
}
@end
