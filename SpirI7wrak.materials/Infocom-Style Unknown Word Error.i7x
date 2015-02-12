Version 3/121004 of Infocom-Style Unknown Word Error by Neil Cerutti begins here.

"Names the first word of player input that is not understood by the parser when reporting a parsing error, in the Infocom style. In other words, provides specific feedback like 'I don't know the word 'kludge.'' instead of the more generic 'You can't see any such thing.'"

"based on original Inform 6 code by Neil Cerutti, with enhancements by Andrew Plotkin, Mike Ciul, and others"

Use authorial modesty.

Include (-
[ FindUnknownWordToken wordnum 
 w twn numwds;
#ifdef TARGET_GLULX;
 numwds = parse-->0;
#ifnot;
 numwds = parse->1;
#endif; ! TARGET_GLULX;
 ! Throw out invalid word numbers
 if (wordnum <= 0 || wordnum > numwds) rfalse;
 twn=wn; ! save the value of wn so it can be restored
 wn=wordnum;
 while (1)
 { w=NextWordStopped();
   if (w == -1) { wn=twn; rfalse; }
   if (w == 0 && TryNumber(wn-1) == -1000) 
   { wordnum=wn-1;
     wn=twn;
     return wordnum; 
   }
 }
];
-)

Include (-
[ PrintToken wordnum 
 k l m numwds;
#ifdef TARGET_GLULX;
 numwds = parse-->0;
#ifnot;
 numwds = parse->1;
#endif; ! TARGET_GLULX;
 ! Throw out invalid word numbers
 if (wordnum <= 0 || wordnum > numwds) return;
 k=WordAddress(wordnum); 
 l=WordLength(wordnum); 
 for (m=0: m < l: m++) 
   print (char) k->m; 
];
-)

To decide what number is the/-- position of the/-- non-dictionary word:
	(- FindUnknownWordToken(1) -)

To say the/-- word at position/-- (N - a number):
	(- PrintToken({N}); -)

Rule for printing a parser error when the latest parser error is the can't see any such thing error (this is the don't know that word rule):
	Let N be the position of the non-dictionary word;
	if N is zero:
		make no decision;
	say "I don't know the word '[word at position N]'."

Rule for printing a parser error when the latest parser error is the not a verb I recognise error (this is the don't know that verb rule):
	Let N be the position of the non-dictionary word;
	if N is zero:
		make no decision;
	if the American dialect option is active:
		say "I don't recognize the verb '[word at position N]'.";
	otherwise:
		say "I don't recognise the verb '[word at position N]'."

Infocom-Style Unknown Word Error ends here.

---- DOCUMENTATION ----

This is an updated and modified wrapper of Neil Cerutti's Dunno extension for Inform 6 with several contributors:  

	Dunno - A Library Extension by Neil Cerutti (cerutti@together.net)
	Version 1.0 - 25 Jun 1999
		Initial release
	Version 1.1 - 2 Apr 2001
		Modified by Andrew Plotkin for Glulx compatibility
	Version 2/110923 - Sep 23 2011
		Enhanced by Mike Ciul for use with Inform 7
	Version 3/121004 - Oct 04 2012
		expanded capability to include unrecognized verbs

This extension should be used if, when the parser does not recognize a word of the player's input, you prefer Infocom-style error messages that say:

	I don't know the word "kludge".

instead of the generic messages:

	You can't see any such thing.

	-or-

	That's not a verb I recognize.

which are the defaults in Inform 7.

To get this behavior, simply include this extension in your story. You should not use this extension if you prefer that the parser not disclose which words are and are not recognized by your story. 

To customize the error messages, you must replace the "don't know that word rule" and/or the "don't know that verb rule", e.g.:

	Rule for printing a parser error when the latest parser error is the can't see any such thing error (this is the customized don't know that word rule):
		Let N be the position of non-dictionary word;
		if N is zero:
			make no decision;
		say "I simply can't fathom what you mean by '[word at position N]'.";
		
	The customized don't know that word rule is listed instead of the don't know that word rule in the for printing a parser error rulebook.

Example: * Ignorance is Bliss - A brief test of this extension.
	
	*: "Ignorance is Bliss"

	Include Unknown Word Error by Neil Cerutti.

	The Conference Chamber is a room. In the Conference Chamber is a table. On the table is a treaty.

	Test me with "examine non-proliferation treaty".

