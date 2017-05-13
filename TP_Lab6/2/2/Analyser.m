//
//  Analyzer.m
//  2
//
//  Created by Admin on 29.04.17.
//  Copyright (c) 2017 Popov. All rights reserved.
//

#import "Analyser.h"

@implementation Analyser

    -(void)foo:(NSString *)text
    {
        NSArray *words = [text componentsSeparatedByString:@" "];
        NSMutableDictionary *statistics = [[NSMutableDictionary alloc] init];
        
        for (NSString* word in words)
        {
            NSNumber *repetitions = [statistics valueForKey:word];
            [statistics setObject:[[NSNumber alloc] initWithLong:
                                   ([repetitions integerValue] + 1)] forKey:word];
        }
        
        for (NSString* key in statistics)
        {
            id numb = [statistics objectForKey:key];
            NSLog(@"%@: %@\n", key, numb);
        }
    }

@end
