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
}

-(NSString *)encodeWithMessage:(NSString *)message andOffset:(NSInteger)key{ // put into number >> read number >> print out letters
    
    NSInteger offSetPassNumber = ([self numberOfString:message] + key);
    NSString * offSetString = [self stingForNumbers: offSetPassNumber];
    
    NSLog(@" %@ offset TO this -%@",message,offSetString);

    return offSetString;
    
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
