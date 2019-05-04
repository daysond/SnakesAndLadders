//
//  main.m
//  SnakeAndLadders
//
//  Created by Dayson Dong on 2019-05-04.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Player *player = [Player new];
        while (![player gameOver]) {
            NSLog(@"please type \"roll\" or \"r\"");
            NSString *input = [InputHandler output];
            if ([input isEqualToString:@"roll"] || [input isEqualToString:@"r"]) {
                [player roll];
                [player updateSquare];
            }
        }
    }
    return 0;
}
