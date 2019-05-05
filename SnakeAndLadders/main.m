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
#import "PlayerManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        PlayerManager *playerManager = [PlayerManager new];
        
        while (YES) {
            [playerManager createPlayer];
            while (![playerManager shouldRestart]) {
                NSString *input = [[InputHandler new] output:@"please type \"roll\" or \"r\"" ];
                if ([input isEqualToString:@"roll"] || [input isEqualToString:@"r"]) {
                    [playerManager roll];
                    [playerManager output];
                }
            }
            [playerManager gameOver];
        }
    }
    return 0;
}
