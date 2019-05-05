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

- (NSUInteger)roll {
    NSUInteger dieNum = [self randomValue];
    self.currentSquare = self.currentSquare + dieNum;
    return dieNum;
}

- (void)updatePlayerStatus {

    if ([_gameLogic objectForKey:[NSNumber numberWithInteger:self.currentSquare]]) {
        self.currentSquare = [_gameLogic[[NSNumber numberWithInteger:self.currentSquare]] integerValue];
        return;
    }
}

@end
