//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here



-(void)hello{
    
    NSLog(@"HELLO");

    
    NSInteger x = [self numberOfString:@"O"];
    
    NSLog(@"%ld",(long)x);
    NSLog(@"%@",[self stingForNumbers:79]);
    //([string characterAtIndex:0] + 2);
    //[self ascciiWithLetter];
    
    // test
    
    [self encodeWithMessage:@"Z" andOffset:2];
    
    [self myOwnTable];
}

-(NSString *)encodeWithMessage:(NSString *)message andOffset:(NSInteger)key{ // put into number >> read number >> print out letters
    
    NSInteger offSetPassNumber = ([self numberOfString:message] + key);
    NSString * offSetString = [self stingForNumbers: offSetPassNumber];
    
    NSLog(@" %@ offset TO this -%@",message,offSetString);

    return offSetString;
    
}


-(NSDictionary *)myOwnTable{
    
   
     NSString * filePath = [[NSBundle mainBundle] pathForResource:@"myTableAssci" ofType:@"txt"];
     NSError *error;
     NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
     NSArray  *stateList = [fileContents componentsSeparatedByString:@"\n"];
    NSLog(@"stateList%@", stateList);
    
    NSMutableDictionary * madeAsciTable = [[NSMutableDictionary alloc] init];
    
    for (NSString * eachCouple in stateList) {
        NSArray * eachPair = [eachCouple componentsSeparatedByString:@","];
        NSLog(@"eachCouple is %@", eachPair);
        [ madeAsciTable setValue: eachPair[1] forKey: eachPair[0] ];
    }
    
    NSLog(@" madeAsciTable %@", madeAsciTable);

    return NO;
}

-(NSString *)decodeWithMessage:(NSString *)encodedMessage
                     andOffset:(NSInteger)key{
    
    NSLog(@"HELLO 2");
    return  @"HELLO 2";
}

-(NSInteger)numberOfString:(NSString *)string{
    
    NSInteger x = [string characterAtIndex:0];

    return x;
}

-(NSString *)stingForNumbers:(NSInteger )number {
    
    NSString * s = [NSString stringWithFormat:@"%c",number];
    return s;
}


@end
