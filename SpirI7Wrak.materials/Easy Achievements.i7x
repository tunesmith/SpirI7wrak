Version 1/141028 of Easy Achievements by Otis The Dog begins here.

Use authorial modesty.

Include Easy I6-Style Scoring by Otis The Dog.

Chapter - Preface

To say (N - a number) spaces: [Recipe Box Ex. 431]
	repeat with index running from 1 to N:
		say " ".

Chapter I - Ways to score

Section I - Achievements

An achievement is a kind of object. Every achievement has a number called point value. The point value of an achievement is usually 1. Every achievement has some text called summary. The summary of an achievement is usually "<blank>". Every achievement has some text called ending punctuation. The ending punctuation of an achievement is usually "". An achievement can be accomplished or unaccomplished. An achievement is usually unaccomplished.

To accomplish (accomplishment - an achievement):
	if accomplishment is accomplished, rule succeeds;
	award point value of accomplishment points;
	now the accomplishment is accomplished.

To list (points scored - an achievement):
	say "[point value of points scored] point[if point value of points scored is not 1]s[end if] for [summary of points scored][ending punctuation of points scored]".

To list points by achievement:
	Repeat with accomplishment running through all accomplished achievements begin;
		say "[5 spaces]";
		list accomplishment;
		say "[line break]";
	end repeat.

Section II - Scored Items

To list points for scored items:
	let item tally be a number;
	repeat with item bonus running through scored tallied things:
		increase item tally by the appropriate object score;
	if item tally is greater than zero:
		say "[5 spaces][item tally] point[if item tally is not 1]s[end if] for finding sundry items[line break]".

Section III - Scored Locations

To list points for scored places:
	let place tally be a number;
	repeat with place bonus running through scored visited rooms:
		increase place tally by the appropriate room score;
	if place tally is greater than zero:
		say "[5 spaces][place tally] point[if place tally is not 1]s[end if] for visiting various locations[line break]".


Chapter II - Requesting the full score

Section I - During play

Requesting the full score is an action out of world. Understand "full" or "full score" or "fullscore" or "what is my score" or "show score" as requesting the full score.

To decide whether (X - an activity) is currently-executing:
	if X is a going on activity:
		decide yes;
	otherwise:
		decide no.

Carry out requesting the full score (this is the display the full score rule):
	if the score is zero:
		if handling the final question activity is currently-executing:
			say "You didn't score any points,[if turn count is 1] which should not be surprising when you didn't manage to do anything before the end of the game[otherwise] despite [turn count] turns of trying[end if].";
			rule succeeds;
		otherwise:
			say "You haven't scored any points yet,[if turn count is 1] which should not be surprising when you haven't done anything yet[otherwise] despite [turn count] turns of trying[end if].";
			rule succeeds;
	otherwise:
		try requesting the score;
		say "The score is made up as follows:[paragraph break]";
		list points for scored items;
		list points for scored places;
		if the number of scored tallied things is greater than zero or the number of scored visited rooms is greater than zero:
			say "[line break]";
		list points by achievement.

Section II - At game's end

Table of Final Question Options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"see FULL score details"	false	"full"	display the full score rule	--

[Luckily, in 6G60 the normal "requesting the score" action will print "In that game..." instead of "You have so far scored..." at the end of the game, so there is no need for special handling.]


Chapter III - Built-in Warnings

Section I - Warning if max scores don't agree - Not for Release

The sum of all scores is a number that varies.

When play begins (this is the max points should equal sum of points rule):
	Repeat with room-point-award running through all scored rooms begin;
		increase the sum of all scores by the appropriate room score;
	end repeat;
	Repeat with object-point-award running through all scored things begin;
		increase the sum of all scores by the appropriate object score;
	end repeat;
	Repeat with task-point-award running through all achievements begin;
		increase the sum of all scores by the point value of task-point-award;
	end repeat;
	if the sum of all scores is greater than the maximum score or the sum of all scores is less than the maximum score, say "*** WARNING: The sum of all achievement, room, and object scores is [the sum of all scores], but the maximum score is set to [maximum score]! ***[paragraph break]".

Section II - Warning if there is no summary for an achievement - Not for Release

When play begins (this is the every achievement should have a summary rule):
	Repeat with unsummarized running through all achievements begin;
		if summary of unsummarized is "<blank>", say "*** WARNING: The achievement called '[unsummarized]' does not have a summary![paragraph break]";
	end repeat;


Easy Achievements ends here.
