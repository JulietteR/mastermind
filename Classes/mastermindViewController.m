//
//  mastermindViewController.m
//  mastermind
//
//  Created by JULIETTE RIVIERE on 12/03/15.
//  Copyright 2015 __MyCompanyName__. All rights reserved.
//

#import "mastermindViewController.h"
#import <Foundation/Foundation.h>
#include <stdio.h> 

@implementation mastermindViewController
@synthesize resultLabel , tempText, textViewPions, insertCombiJ0, insertCombiJ1, insertCombiJ2, insertCombiJ3; // combiActuelleJoueur;

- ( IBAction ) affichage : (id) sender {
	
	[self correction];
	for (int k=0; k<pionRouge; k++) { // affiche le nombre total de pions bien placés
		[textViewPions setText:[[NSString alloc] initWithFormat:@"%@ rouge",[textViewPions text]]];
		
		
	} 
	for (int k=0; k<pionBlanc; k++) { // affiche le nombre total de pions mal placés
		[textViewPions setText:[[NSString alloc] initWithFormat:@"%@ blanc",[textViewPions text]]];
	}
	while (nbdePionPlace<4) { // affiche le nombre total de pions faux
		[textViewPions setText:[[NSString alloc] initWithFormat:@"%@ X",[textViewPions text]]];
		nbdePionPlace++;	
		
	}
	
	[textViewPions setText:[[NSString alloc] initWithFormat:@"%@\n",[textViewPions text]]];
	
	if (pionRouge==4){
		/*[textViewPions setText:[[NSString alloc] initWithFormat:@"%@ Tu as gagné, c'est royal ;)",[textViewPions text]]];
		 break; // Pour ne pas afficher 4 fois la phrase
		 */
		
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Bravo" 
														message:@"C'est royal, tu as gagné ! Rejouer ?"
													   delegate:self 
											  cancelButtonTitle:@"Cancel" 
											  otherButtonTitles:@"Rejouer", nil];
		[alert show];
	}
	
	// pour déterminer que le joueur doit trouver la combi en moins de 10 tours pour gagner
	
	tours++;
	
	if (tours==10) {
		
		
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Royal ..." 
														message:@"Tu as perdu ! Rejouer ?"
													   delegate:self 
											  cancelButtonTitle:@"Cancel" 
											  otherButtonTitles:@"Rejouer", nil];
		
		[alert show];	
		for (int i=0; i<4; i++) {
			
			
			[combiActuelleJoueur setText:[[NSString alloc] initWithFormat:@"%@ %@",[combiActuelleJoueur text], [combOrdi objectAtIndex:i]]];
			
			
			
			
		} 	
	}
	
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	if (buttonIndex == 1)
    {
		[textViewPions setText:[[NSString alloc] initWithFormat:@""]];
		[combiActuelleJoueur setText:[[NSString alloc] initWithFormat:@""]];
		[insertCombiJ0 setText:[[NSString alloc] initWithFormat:@""]];
		[insertCombiJ1 setText:[[NSString alloc] initWithFormat:@""]];
		[insertCombiJ2 setText:[[NSString alloc] initWithFormat:@""]];
		[insertCombiJ3 setText:[[NSString alloc] initWithFormat:@""]];
		
		combOrdi = [[NSMutableArray alloc] init];//= [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:4], [NSNumber numberWithInt:3], [NSNumber numberWithInt:2], nil];
		
		for (int z=0; z<4; z++) {
			int nombreChoisi = 1+arc4random()%5;
			[combOrdi addObject:[NSNumber numberWithInt:nombreChoisi]];
			
		}	
	}
}

- ( void ) viewDidLoad {
	combOrdi = [[NSMutableArray alloc] init];//= [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:4], [NSNumber numberWithInt:3], [NSNumber numberWithInt:2], nil];
	
	for (int z=0; z<4; z++) {
		int nombreChoisi = 1+arc4random()%5;
		[combOrdi addObject:[NSNumber numberWithInt:nombreChoisi]];
		
		
	}
	tours=0;
}


- (int) correction {
	
	NSMutableArray *combJoueur = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:[insertCombiJ0.text intValue]],[NSNumber numberWithInt:[insertCombiJ1.text intValue]], [NSNumber numberWithInt:[insertCombiJ2.text intValue]], [NSNumber numberWithInt:[insertCombiJ3.text intValue]], nil];
	nbdePionPlace=0;
	pionRouge=0; // cette variable et sa soeurette pionBlanc permettent de stocker les pions bien et mal placés pour l'affichage. pionRouge est aussi nécessaire pour véirfier si le joueur gagne
	pionBlanc=0;
	
	
	//NSMutableArray * combOrdi = [NSMutableArray arrayWithObjects:@"2",@"3",@"5",@"1", nil];
	//NSMutableArray * combJoueur = [NSMutableArray arrayWithObjects:@"4",@"5",@"2",@"1", nil];
	
	for (int i=0; i<4; i++) {
		//la ligne 1 permet de débugger en affichant le code de l'ordi (mais faut mettre la ligne 2 en comme
		//[combiActuelleJoueur setText:[[NSString alloc] initWithFormat:@"%@ %@",[combiActuelleJoueur text], [combOrdi objectAtIndex:i]]];
		[combiActuelleJoueur setText:[[NSString alloc] initWithFormat:@"%@ %@",[combiActuelleJoueur text], [combJoueur objectAtIndex:i]]];
	} 		
	
	[combiActuelleJoueur setText:[[NSString alloc] initWithFormat:@"%@\n",[combiActuelleJoueur text]]];
	
	// Test des égalités entre la combi joueur et le combi ordi 
	for (int i=0; i< [combJoueur count] ; i++) {	
		
		NSMutableArray *tempCombOrdi = [NSMutableArray arrayWithArray:combOrdi];  
		if ([tempCombOrdi objectAtIndex:i]==[combJoueur objectAtIndex:i]){
			nbdePionPlace++; 	
			pionRouge++; 
			[tempCombOrdi replaceObjectAtIndex:i withObject:@"0"]; // Remplace le pion bien placé par 0 pour éviter sa relecture
		}
		else {
			for (int j=0; j<4; j++) {
				if ([tempCombOrdi objectAtIndex:j]==[combJoueur objectAtIndex:i]&&[tempCombOrdi objectAtIndex:j]!=[combJoueur objectAtIndex:j]){ // Le && oblige à ne pas compté un pion en blanc lorsqu'il correspond déjà à un rouge
					nbdePionPlace++;
					pionBlanc++;
					[tempCombOrdi replaceObjectAtIndex:j withObject:@"0"]; // Remplace le pion mal placé par 0 pour éviter sa relecture
					break;
				}
			}
		} 
	}
	
	
	
	
	
	
}

- ( IBAction ) textFieldReturn :( id) sender
{
	[ sender resignFirstResponder ];
} 



- ( void ) viewDidUnload {
	// Release any retained subviews of the main view .
	// e.g. self . myOutlet = nil;
	self . resultLabel = nil;
	self . tempText = nil;
	//self . combOrdi = nil;
}
- ( void ) dealloc {
	[ resultLabel release ];
	//[ combOrdi release ];
	[ tempText release ];
	[ super dealloc ];
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}





@end
