scene1 = "You've just arrived at WTAMU an found that you could use a few " +
		 "things to spice up your new dorm room.  Quite by accident you " +
		 "happen across an antique furniture store.  Behind the counter is a " +
		 "rather unhappy looking gentleman.  Upon seeing you his demeanor " +
		 "brightens.  'Excellent!  A customer, finally!  I haven't had a " +
		 "single customer since I hired this code monkey here!'.  Following " +
		 "the shopowner's gesture, you see a rather disgruntled looking " +
		 "chimpanzee sitting in the back typing away at what appears to be " +
		 "an unplugged computer.  'I hired him to spruce up the sign outside " +
		 "but he's rather bungled up the capitalization and I'm afraid it " +
		 "isn't as easy to read as it should be when people drive by.  By " +
		 "chance would you happen to know a bit of programming?  I sure could " +
		 "use the help."

scene2 = "'Excellent!  It looks fantastic!  Unfortunately, due to the lack " +
		 "of customers and the cost to get this chimp flea dipped, I can't " +
		 "really afford to pay you.  What I can do is give you this old chest " +
		 "that I'm quite tired of dealing with.'  As you start to tell the " +
		 "shop owner that you don't need a chest, he shrugs you off and continues " +
		 "'Of course every young college student needs a chest, a sea chest at " +
		 "that!  Why think of all the rum it must be able to hold!  Now, if " +
		 "you don't have any money to spend, I must ask you to leave with that " +
		 "rather unsightly chest you've brought in as I am not buying anything " +
		 "at the moment, and take that monkey with you!'\n     Arriving back " +
		 "at your dorm with a new old sea chest and an ape in tow, you try " +
		 "to open it (the chest, not the chimp!).  Drat, it's locked!  You " +
		 "look to the chimp  in hopes he might know something about the " +
		 "chest.  He's not even paying attention, instead he's making a rather " +
		 "rude gesture to himself in the mirror.  Double drat, the chimp's an " +
		 "idiot!  It's up to you to get this chest open.  You notice some " +
		 "scribbles above what seems to be a combination lock.  Perhaps a " +
		 "little code fu may be in order."

scene3 = "Success!  As the lid opens, you receive a rather strong slap on " +
		 "the back by your new roommate, the chimp with no name.  That " +
		 "stung rather fiercely, but luckily enough the impact has caused " +
		 "you to lurch far enough into the chest giving you a new angle " +
		 "in which to view the inside of the chest.  You spot a rather " +
		 "curious seam, and upon a bit of force and a screwdriver, you " +
		 "manage to pry it open.  Inside you find an odd assortment of " +
		 "items including some old letters, a 5 1/4\" floppy disk, a " +
		 "rubber mallet, and an old oil cloth.  The chimp immediately " +
		 "grabs the mallet and hits you upside the head with it!  Ouch!  " +
		 "The chimp smiles back at you as you give him you best, most " +
		 "menacing stare.  Realizing there's no way you're going to " +
		 "beat a chimp one on one, you return to giving the chest's " +
		 "contents your undivided attention.  Upon closer inspection, you " +
		 "unravel the oilcloth and notice that the markings on in could " + 
		 "only be some sort of treasure map!  Who's chest was this, where " +
		 "could this map lead, and does anyone have a floppy drive in " +
		 "their computer anymore?  Looking at the letters, you notice one " +
		 "that states 'In case of my untimely demise, seek out...'  It " +
		 "seems to end in a bunch of gibberish.  You feel a tap on your " +
		 "shoulder.  As you turn around, you see Chimp Eastwood handing " +
		 "you two items: your laptop and the mallet.  Maybe he's not so " +
		 "stupid after all.  You realize that the gibberish may just be " +
		 "some sort of code, and with a bit of programming wizardry, " +
		 "you might just be able to crack it!"

scene4

Scene.delete_all

Scene.create!(title: 'The Beginning',
			  description: 'The beginning...',
			  visual: 'code goes here',
			  transcript: "#{scene1}")

Scene.create!(title: 'Getting the Chest',
			  description: "You've succeeded in your task and gotten an odd payment",
			  visual: 'code goes here',
			  transcript: "#{scene2}")

Scene.create!(title: 'What Lies Inside',
			  description: 'You open the chest to find...',
			  visual: 'code goes here',
			  transcript: "#{scene3}")