//
//  PlayerManager.m
//  SnakeAndLadders
//
//  Created by Dayson Dong on 2019-05-05.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "PlayerManager.h"
#import "InputHandler.h"


@implementation PlayerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [[NSMutableArray alloc]init];
        _currentIndex = 0;
        _gameShouldRestart = YES;
        _gameOn = YES;
    }
    return self;
}

#pragma mark - private

-(NSInteger)parseInput {
    while (YES) {
        
        InputHandler *inputHandler = [InputHandler new];
        NSString* input = [inputHandler output:@"Please enter the number of players or enter \'quit\' to quit. "];
        if ([input intValue]) {
            return [input intValue];
        } else if ([input isEqualToString:@"quit"]) {
            input = [inputHandler output:@"Would you like to quit or restart? Enter \'restart\' to restart, anything else to quit."];
            if ([input isEqualToString:@"restart"]) {
                _gameShouldRestart = YES;
            } else {
                _gameOn = NO;
            }
            return 0;
        } else {
            NSLog(@"Please enter a valid number!");
        }
    }
}

- (void)roll {
    if (self.currentIndex == self.players.count) {
        self.currentIndex = 0;
    }
    [self.players[self.currentIndex] roll];
}

- (void)output {
    [self.players[self.currentIndex] updatePlayerStatus];
    self.gameShouldRestart = [self.players[self.currentIndex] gameOver];
    self.currentIndex ++;
}

- (NSString *)score {
    NSMutableString *score = [NSMutableString stringWithFormat:@"Score: "];
    for (int i = 0; i < [self.players count]; i++) {
        [score appendFormat:@"%@: %ld ",[self.players[i].name capitalizedString], self.players[i].currentSquare];
    }
    return [NSString stringWithString:score];
}

#pragma mark - public

- (void)createPlayer {
    if ([self.players count] == 0) {
        NSInteger numberOfPlayers = [self parseInput];
        for (int i = 0; i < numberOfPlayers; i++) {
            Player *player = [[Player alloc]init];
            NSString *name = [[InputHandler new] output:[NSString  stringWithFormat: @"Enter player%d name: ",i+1]];
            [player setName:name];
            [self.players addObject:player];
        }
    }
}

-(void)endGame{
    [self.players removeAllObjects];
    self.currentIndex = 0;
    self.gameShouldRestart = NO;
}

-(void)startGame {
    NSString *input = [[InputHandler new] output:@"please type \"roll\" or \"r\"" ];
    if ([input isEqualToString:@"roll"] || [input isEqualToString:@"r"]) {
        [self roll];
        [self output];
        NSLog(@"%@",[self score]);
    }
}

@end
