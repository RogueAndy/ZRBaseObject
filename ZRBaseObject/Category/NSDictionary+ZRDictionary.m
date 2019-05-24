//
//  NSDictionary+ZRDictionary.m
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/1/10.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "NSDictionary+ZRDictionary.h"

@implementation NSDictionary (ZRDictionary)

- (id)dicValueforKey : (NSString *)key
{
    id value = [self objectForKey:key];
    if([value isKindOfClass:[NSNull class]] || !value)
    {
        return @{};
    }
    else
    {
        return value;
    }
}

- (BOOL)dicBOOLForKey:(NSString *)key {
    id value = [self objectForKey:key];
    if([value isKindOfClass:[NSNull class]] || !value)
    {
        return false;
    }
    else
    {
        NSString *boolStr = [NSString stringWithFormat:@"%@",value];
        if ([boolStr isEqualToString:@"0"]) {
            return false;
        }else {
            return true;
        }
    }
}

- (NSString *)dicStringForKey:(NSString *)key {
    id value = [self objectForKey:key];
    if([value isKindOfClass:[NSNull class]] || !value)
    {
        return @"";
    }
    else
    {
        return [NSString stringWithFormat:@"%@",value];
    }
}

- (int)dicIntForKey:(NSString *)key {
    NSString *valueString = [self dicStringForKey:key];
    if (valueString.length) {
        return [valueString intValue];
    }else {
        return 0;
    }
}

- (NSInteger)dicIntegerForKey:(NSString *)key {
    NSString *valueString = [self dicStringForKey:key];
    if (valueString.length) {
        return [valueString integerValue];
    }else {
        return 0;
    }
}

- (CGFloat)dicFloatForKey:(NSString *)key {
    NSString *valueString = [self dicStringForKey:key];
    if (valueString.length) {
        return [valueString floatValue];
    }else {
        return 0.0;
    }
}

- (NSArray *)dicArrayForKey:(NSString *)key {
    
    id value = [self objectForKey:key];
    if([value isKindOfClass:[NSNull class]] || !value)
    {
        return @[];
    }
    else
    {
        return value;
    }
}

- (NSArray *)dicArrayForKey:(NSString *)key
          separatedByString:(NSString *)separator {
    
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || !value)
    {
        return @[];
    }else if ([value isKindOfClass:[NSString class]])
    {
        return [value componentsSeparatedByString:separator];
    }
    return @[];
}

-(NSArray *)dicArrayContentForKey:(NSString *)key separatedByString:(NSString *)separator{
    
    NSMutableArray *arrayRetun = [[NSMutableArray alloc]init];
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || !value)
    {
        return @[];
    }else if ([value isKindOfClass:[NSString class]])
    {
        
        NSArray *array = [value componentsSeparatedByString:separator];
        for (int i = 0; i<array.count; i++) {
            if ([NSString stringWithFormat:@"%@",array[i]].length>0) {
                [arrayRetun addObject:array[i]];
            }
        }
    }
    
    return arrayRetun;
    
}

- (NSString *)JSONString {
    
    if (!self) {
        return @"";
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:kNilOptions error:nil];
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
}

@end
