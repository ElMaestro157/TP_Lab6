//
//  main.m
//  2
//
//  Created by Admin on 29.04.17.
//  Copyright (c) 2017 Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Analyser.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Analyser *analyser = [[Analyser alloc] init];
        
        [analyser foo:@"boo foo foo aaa nnz aa aaa"];
        return 0;
    }
    return 0;
}
