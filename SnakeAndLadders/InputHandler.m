//
//  InputHandler.m
//  SnakeAndLadders
//
//  Created by Dayson Dong on 2019-05-04.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

- (NSString *)output: (NSString*)prompt{
    NSLog(@"%@",prompt);
    char input[255];
    fgets(input, 255, stdin);
    return [[[NSString stringWithUTF8String:input] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] lowercaseString];
}

@end
