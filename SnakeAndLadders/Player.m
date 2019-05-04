//
//  Player.m
//  SnakeAndLadders
//
//  Created by Dayson Dong on 2019-05-04.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "Player.h"

@interface Player()

@property (nonatomic) NSDictionary* gameLogic;

@end

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
        _gameOver = NO;
        _gameLogic = @{@4: @14, @9: @31, @17: @7, @20: @38, @28: @84, @40: @59, @51: @67, @63: @81, @64: @60, @89: @26, @95: @75, @99: @78 };
    }
    return self;
}

#pragma mark private

-(NSUInteger)randomValue {
    return arc4random_uniform(6)+1;
}

#pragma mark public

- (void)roll {
    NSUInteger dieNum = [self randomValue];
    NSLog(@"You rolled a %ld",dieNum);
    self.currentSquare = self.currentSquare + dieNum;
}

- (void)updateSquare {

    if ([_gameLogic objectForKey:[NSNumber numberWithInteger:self.currentSquare]]) {
        NSUInteger previousSquare = self.currentSquare;
        self.currentSquare = [_gameLogic[[NSNumber numberWithInteger:self.currentSquare]] integerValue];
        
        (self.currentSquare > previousSquare) ? NSLog(@"Stairway to heaven! You jumped from %ld to %ld.",previousSquare,self.currentSquare) : NSLog(@"Uh-oh, you got eaten by a snake. Now back to %ld from %ld.",self.currentSquare,previousSquare);
        return;
    }
    
    if (self.currentSquare > 100) {
        self.gameOver = YES;
        NSLog(@"Congrats! You won!");
    } else {
        NSLog(@"you landed on %ld",self.currentSquare);
    }
    
    
}



@end
