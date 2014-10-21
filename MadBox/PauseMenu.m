//
//  PauseMenu.m
//  MadBox
//
//  Created by Vinu Ilangovan on 2/23/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PauseMenu.h"
#import "MainGame.h"


@implementation PauseMenu

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	PauseMenu *layer = [PauseMenu node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		//CCMenuItemImage *item1 = [CCMenuItemImage itemWithNormalImage:@"Play Button 2.png" selectedImage:@"Play Button 2.png"];
        CCMenuItemImage *playB = [CCMenuItemImage itemWithNormalImage:@"Play Button 2.png" selectedImage:@"Play Button 2 Pressed.png" target:self selector:@selector(gotoGame:)];
        
        CCMenu *menu = [CCMenu menuWithItems:playB, nil];
        
        
        [self addChild:menu];
        
	}
	return self;
}

-(void)gotoGame:(id)sender{
    
    
    
    //[[CCDirector sharedDirector]popScene];
    
    //[[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[MainGame node] withColor:ccWHITE] ];
}



@end
