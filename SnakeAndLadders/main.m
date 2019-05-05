//
//  main.m
//  SnakeAndLadders
//
//  Created by Dayson Dong on 2019-05-04.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        PlayerManager *playerManager = [PlayerManager new];
        
        while ([playerManager gameOn]) {
            
            if ([playerManager shouldRestart]) {
                [playerManager gameOver];
                [playerManager createPlayer];
                continue;
            }
            [playerManager startGame];
        }
    }
    return 0;
}
