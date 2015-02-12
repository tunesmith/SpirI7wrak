Version 1/140505 of Easy I6-Style Scoring by Otis The Dog begins here.

Use authorial modesty.

[I6 allowed the author to designate locations or objects as 'scored', which would award points the first time the player visited or held them, respectively.

Note that the equivalent logic is implemented using every turn rules, so that it does not matter how the player got to the scored room or got ahold of the scored thing. The rule for scored things is a little indirect due to the inability to test the past state of temporary value for the object, i.e. "Every turn when the player carries a scored thing (called treasure)..."]

Chapter I - Basic Scoring

Section I - Room Scoring

A room can be scored or unscored. A room is usually unscored.

The default room score is a number that varies. The default room score is 5.

The universal room score is a number that varies. [To be set in main story, if overriding default.]

To decide what number is the appropriate room score:
	if the universal room score is not zero:
		decide on the universal room score;
	otherwise:
		decide on the default room score.

Every turn when the location is a scored room (this is the award points for entering a scored room for the first time rule):
	if the location was unvisited:
		increase the score by the appropriate room score.

Section I - Object Scoring

A thing can be scored or unscored. A thing is usually unscored. A thing can be tallied.

The default object score is a number that varies. The default object score is 4.

The universal object score is a number that varies. [To be set in main story, if overriding default.]

To decide what number is the appropriate object score:
	if the universal object score is not zero:
		decide on the universal object score;
	otherwise:
		decide on the default object score.

Last Every turn when the player carries a scored thing that is not tallied (this is the award points for obtaining scored objects rule):
	repeat with prize running through scored not tallied things carried by the player:
		now prize is tallied;
		increase the score by the appropriate object score.

Easy I6-Style Scoring ends here.
