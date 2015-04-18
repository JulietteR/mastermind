//
//  mastermindViewController.h
//  mastermind
//
//  Created by JULIETTE RIVIERE on 12/03/15.
//  Copyright 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mastermindViewController : UIViewController <UIAlertViewDelegate>{

	UITextField * tempText ;
	UILabel * resultLabel ;
	UITextView * textViewPions;
	UITextView * combiActuelleJoueur;
	UITextField * insertCombiJ0;
	UITextField * insertCombiJ1;
	UITextField * insertCombiJ2;
	UITextField * insertCombiJ3;
	int nbdePionPlace;
	int pionRouge; // cette variable et sa soeurette pionBlanc permettent de stocker les pions bien et mal placés pour l'affichage. pionRouge est aussi nécessaire pour véirfier si le joueur gagne
	int pionBlanc;
	int tours;
	NSMutableArray *combOrdi;
	

	
}
@property ( nonatomic , retain ) IBOutlet UILabel * resultLabel ;
@property ( nonatomic , retain ) IBOutlet UITextField * tempText ;
@property ( nonatomic , retain ) IBOutlet UITextView * textViewPions ;
@property ( nonatomic , retain ) IBOutlet UITextView * combiActuelleJoueur ;
@property ( nonatomic , retain ) IBOutlet UITextField * insertCombiJ0 ;
@property ( nonatomic , retain ) IBOutlet UITextField * insertCombiJ1 ;
@property ( nonatomic , retain ) IBOutlet UITextField * insertCombiJ2 ;
@property ( nonatomic , retain ) IBOutlet UITextField * insertCombiJ3 ;

- (IBAction)affichage:(id)sender ;

-(IBAction)textFieldReturn:(id)sender ;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
 

@end

