## Assignment: Project 2
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 9.28.15.1
## Purpose: Demonstrate Recusion and "if" statments 

use 5.14.1;
use warnings;

use constant "MIN_CHARGE" => 30;
use constant "OAK_PRICE" => 15;
use constant "DOLLAR_SIGN" => '$';
use constant "MAX_CHARACTERS" => 6;
use constant "WHITE" => 1;
use constant "GOLD_LEAF" => 2;
use constant "MAX_RECUSION" => 2;
use constant "WRONG_COLOR" => 2;

my ($counter, $finalMaterial, $totalCost, $characters, $fontColor, $orderNumber, $name, $errorCode, $characterMultiplier, $totalCharacters);


sub main {
	if (!(defined $totalCost)){
		$totalCost = MIN_CHARGE;
	}
	system("cls");
	print ("\n\n\t\t\t\tHello! I make signs! \n\n");
	setCounter();
	setOrderNumber();
	setName();
	setMaterial();
	setCharacters();
	doCharacterMath();
	setColors();
	printResults();
	askToContinue();
}

main();

sub setCounter {
	if (!(defined $counter)){
		$counter = 0;
	}
	else {
		$counter++;
	}
	if ($counter == MAX_RECUSION){
		print "\n\nyou take up too much energy, goodbye!\n\n";
		sleep 2;
		die;
	}
		
}

sub setOrderNumber {
	print "\n\nWhat is your order number? ";
	chomp ($orderNumber = <STDIN>);
}

sub setName {
	print "\n\nWhat is your name? ";
	chomp ($name = <STDIN>);
}

sub setMaterial {
	system("cls");
	my $woodType;
	use constant "OAK" => 1;
	use constant "PINE" => 0;
	print ("\n\n\tThe materials I can make a sign out of are Pine and Oak ". DOLLAR_SIGN ."15 \n\n\tWhat type of wood do you want? Enter 0 for Pine or 1 for Oak ");
	chomp ($woodType = <STDIN>);
	if ($woodType == OAK ){
		$finalMaterial = "Oak";
		$totalCost = $totalCost + OAK_PRICE;
		}
	elsif ($woodType == PINE){
		$finalMaterial = "Pine";
		}
	else {
		$errorCode = 1;
		displayError();
	}
}

sub setCharacters {
	$characterMultiplier = 0;
	print ("\n\n How many characters will be on your sign? ");
		chomp ($characters = <STDIN>);
		if ($characters > MAX_CHARACTERS){
			$characterMultiplier = $characters - MAX_CHARACTERS;
			print "multiply";
			sleep 2;
			doCharacterMath();
			
		}	
	}

sub setColors {
	use constant "GOLD_COST" => 12;
	my $fontChoice;
	print ("What color font do you what? You can have black(0), white(1), or gold leaf(2) ");
	chomp ($fontChoice = <STDIN>);
	if ($fontChoice == 0){
		$fontColor = "Black";	
	}
	elsif ($fontChoice == WHITE){
		$fontColor = "White";
	}
	elsif ($fontChoice == GOLD_LEAF){
		$fontColor = "GOLD";
		$totalCost = $totalCost + GOLD_COST;
		
	}
	else {
		$errorCode = WRONG_COLOR;
		displayError();
	}
}
sub printResults {
	print ("\n\nName: $name");
	print ("\n\nOrder Num : $orderNumber ");
	print ("\n\nMaterial: $finalMaterial ");
	print ("\n\nCost: $totalCost ");
	print ("\n\nCharacters: $characters ");
	print ("\n\nFont Color: $fontColor\n\n ");
	sleep 5;
	
}

sub displayError {
	use constant "WRONG_MATERIAL" => 1;

	if ($errorCode == WRONG_MATERIAL) {
		print "\nThere is no material for the number you picked! Try again\n\n ";
		sleep 1;
		setMaterial();
	}
	else {
		print "\nThere is no color for the number you picked! Try again\n\n ";
		sleep 1;
		setColors();
	}
}

sub askToContinue {
	my $continue;
	use constant "YES" => 1;
	use constant "NO" => 0;
	print "\n\nWould you like to make another sign?(1for yes 0 for no ) ";
	chomp ($continue = <STDIN>);
	if ($continue == YES){
		main();
	}
	elsif ($continue == NO) {
		die;
	}
	else {
		print "\n\nNot a correct answer!\n\n";
		sleep 2;
		askToContinue();
		
	}
}

sub doCharacterMath {
	$totalCharacters = $characters * $characterMultiplier;
}