EXTERNAL Name(charName)
EXTERNAL Icon(charName)
EXTERNAL Background(charName)
{Name("")}
{Icon("Empty_Character")}

/*
 

*/

VAR time = -1 //  0 Morning, 1 Noon, 2 Night
VAR day = -1 // 0 Thursday, 1 Friday , 2 Saturday, 
VAR Options = 0 // 0 Daylight Strike, 1 The Moon Festival, 2 Underground Route, 
VAR Option = 0


VAR Speed = 2
VAR Damage = 3
VAR Defense = 2

VAR Items = 0 
VAR Sword = 0
VAR Bow = 0 
VAR Boots = 0 
VAR Cuffs = 0
VAR Potion = 0

VAR King = 0 
VAR Bachita = 0
VAR Pipsqueak = 0
VAR alone = 1 


{Name("")}
{Icon("Empty_Character")}
{Background("Camp_Day")}
-> camp 

== camp == 
Heist of the Moon Festival

{Name("Narrator")}
{Icon("Empty_Character")}
{Background("Camp_Day")}

It is { advance_time () }
On { advance_day () }

The morning sun filters through the trees, casting long shadows over the dirt path leading into the bandits' camp. 
The air smells faintly of smoke and earth, the remnants of last night’s fire still hanging in the cool breeze. The place itself is alive with activity—gruff voices, the clatter of iron, and the flicker of campfires as a ragtag crew of thieves prepare for the night soon to come.

* [ Continue... ] -> Midnight_Syndicate
-> END

== Midnight_Syndicate ==

You are a member of the infamous Midnight Syndicate, a house of thieves, mercenaries, and cutthroats who have made their fortune from plunder and cunning. 
Your syndicate has grown in both number and reputation over the years, but there are still few who possess the nerve to attempt a heist so grand it' could go down in history. 
Today is different. This isn’t just any petty robbery. It’s the heist of the millinium. 

Tomorrow, during the moon festival, the kingdom’s most prized treasures will be on display at the royal palace—rich tapestries, rare relics, and, most coveted of all, a collection of ancient weaponry thought to be lost for centuries. A fortune worth more than anything you’ve seen with eyes the likes of the Gods.

* [ Continue... ] ->problem1
-> END

== problem1 ==

But there’s a problem. 
The palace’s walls are fortified, its guards loyal and countless. Most of the guild has turned down the task, too afraid of being caught or even killed. Only a handful of the bravest—or most foolish—dare to step forward. A team of four will sneak into the heart of the kingdom under the cover of the moon’s glow, strike during the busy life of the festival, and steal all that they can carry. 
And you, the thief—quick-witted, silent in your steps, hungry for more than just scraps from the roadside—are one of them.

* [ Continue...] -> tonight
-> END

== tonight == 
{Name("")}{Icon("Empty_Character")}Tonight, you’ll meet with the others. Together, you’ll plan, strategize, gather your materiels and rehearse your roles.
Tomorrow, you’ll either succeed beyond your wildest dreams… or fall to the blades of the kingdom’s finest. No matter the cost, you’re in this now. 
There’s no turning back.

* { King < 1 } [ Meet with your team ] -> team_meeting 
* { alone > 0 } [ Scout the defences Alone ] -> palace_walls 
* { King > 0 } { Option < 1 } [Scout with King] -> King_Scout
* { Items < 1 } { King > 0 } [ Gather supplies ] -> storage_tent
* { King > 0 } { Items > 0 } { Option > 0 } [ Talk to Syndicate leader ] -> Leader 
* { King > 0 } { Bachita > 0 } { Items > 0 } [ Decide on the Plan ] -> let_em_know2

-> END


=== team_meeting ===

The fire crackles as your team gathers around, the tension thick in the air. 
* [ Meet the team ] -> team_game
-> END 

== team_game ==

 ~ King = King + 1
 ~ Bachita = Bachita + 1
 ~ Pipsqueak = Pipsqueak + 1


{Name("Pipsqueak")}{Icon("Pipsqueak")}Pipsqueak, tall and built like a bull, stands with a grin, his caramel skin glowing in the firelight. "You’re late," he rumbles. "We’ve been waiting."

{Name("The King")}{Icon("The King")}Next to him, The King —silent and calculating—fingers the edge of a map, his dark eyes scanning it with a sharp focus. "We’ve got a way in," he says softly, his voice carrying weight. "But it won’t be easy."

{Name("Bachita")}{Icon("Bachita")}Bachita, the fastest of the bunch, stands off to the side, her jet-black braid whipping in the wind. Her navy mask conceals her face, but the cold steel in her gaze is clear. "We don’t get second chances. Whatever we do, it has to be clean."

* [ Make a plan ] -> let_em_know
-> END

== let_em_know ==

{Name("")}{Icon("Empty_Character")}You take a breath, laying out the options before them:

Option One: Daylight Strike. “We blend in with the festival setup, slip through the back alleys, and get out before the crowd swells. It’s risky, but the cover is thick.”

{Name("Pipsqueak")}{Icon("Pipsqueak")}Pipsqueak scoffs. "Too much chance of getting spotted. There’s no room for mistakes."

Option Two: The Moon Festival . “We slip in during the height of the festival. The crowds will cover us, and we vanish into the woods once we have what we need.”

{Name("The King")}{Icon("The King")}King nods, tapping his finger on the map. “We can use the confusion to our advantage. But we’ll need to move fast.”

{Name("Bachita")}{Icon("Bachita")}Bachita smiles under her mask. "I’ll be in and out before anyone even knows we’re there."

Option three : The underground Tunnels. "Secret passage ways that our Syndicate haev been using for years to get in and out of the Kingdoms walls unoticed" 

{Name("Pipsqueak")}{Icon("Pipsqueak")}Pipsqueak raises an eyebrow. "Could be good... unless the tunnels are sealed."

{Name("Bachita")}{Icon("Bachita")}Bachita nods. "But if they’re open, it’s our cleanest way in."

{Name("")}{Icon("Empty_Character")}The group falls quiet, each option holding its own risks. You’re in charge of the decision now.

* [ Option one : Daylight Srike ] -> Selection_1
* [ Option two : The Moon Festival ] -> Selection_2
* [Option three : Underground Route ] -> Selection_3
* [Gather more intel first ] -> tonight
-> END

== let_em_know2 ==

{Name("")}{Icon("Empty_Character")}You take a breath, laying out the options before them:

Option One: Daylight Strike. “We blend in with the festival setup, slip through the back alleys, and get out before the crowd swells. It’s risky, but the cover is thick.” 

" King and I, after watching the guards know that we are going to need more than our daggers. So make sure you all have the weapons you need"

{Name("Pipsqueak")}{Icon("Pipsqueak")}Pipsqueak scoffs. "If it comes down to strength, I have your guys' back."

Option Two: The Moon Festival . “We slip in during the height of the festival. The crowds will cover us, and we vanish into the woods once we have what we need.”

" We watched them practice their passages and guard changes for the night of the festival, and it looks like these guards are lighter on their armour incase they need to move. If we plan on going in the night we need to wear the right foot gear to out run them. Got it?"

{Name("The King")}{Icon("The King")}King nods, tapping his finger on the map. “ Not that we will have to worry about Bachita, but we should all find some equipment so we can keep up"

{Name("Bachita")}{Icon("Bachita")}Bachita smiles under her mask. "We already knew that, speed was never an issue."

Option Three: Underground Route. " After scouting the path to the tunnels with The King, we found that they have places a guard outpost just beyond its entrance. So our third option is off the table."

{Name("Pipsqueak")}{Icon("Pipsqueak")}Pipsqueak suffles his feet and with a defeated look, nods in agreement. " it would be a suicide misson, I am not happy about it, but youre right" 

{Name("Bachita")}{Icon("Bachita")}Bachita nods in agreement. 

{Name("")}{Icon("Empty_Character")}The group falls quiet, each option holding its own risks. You’re in charge of the decision now.

* [ Option one : Daylight Srike ] -> Selection_1
* [ Option two : The Moon Festival ] -> Selection_2
-> END

== Selection_1 == 
~ Option = Option + 1
{Name("")}{Icon("Empty_Character")}The team nods in agreement.

* [ Get prepared ] -> tonight

-> END

== Selection_2 == 
~ Option = Option + 2
{Name("")}{Icon("Empty_Character")}The team nods in agreement.

* [ Get prepared ] -> tonight

-> END

== Selection_3 == 
~ Option = Option + 3
{Name("")}{Icon("Empty_Character")}The team nods in agreement.

* [ Get prepared ] -> tonight

-> END

== palace_walls ==

~ alone = alone - 1

{Name("")}{Icon("Empty_Character")}The palace looms ahead, its stone walls rising high against the sky, and you wander through the streets, taking in the scene. People bustle about, preparing for the festival, setting up stalls and banners. In the distance, you spot guards stationed at intervals along the outer wall, but no sign of movement. It’s calm, peaceful, almost too calm.

A few hours later, you overhear some locals talking in hushed tones about the upcoming festivities. A woman mentions the masks. “Everyone will be wearing them,” she says, voice low. “Perfect cover for the masqurade, don't you think?" 

You smile to yourself. Masks. A perfect way to blend in.

As you walk back to camp, you feel the weight of your decision—whether by daylight or in the cover of night, you’ll need to decide soon.

* [ Get back to planning ] -> tonight

-> END

== King_Scout ==

{Name("The King")}{Icon("King")}It is { advance_time () }

The sun hangs low in the sky as you and The King make your way toward the palace walls. His footsteps are silent, as always, his eyes sharp. The two of you move through the outskirts of the city, keeping to the alleyways and backstreets. It’s the first real chance you’ve had to scout the palace up close, and you need to know its every weakness before you can make a move.

As you near the outer walls, The King slows, signaling for you to stop. He crouches low, peering around a corner toward the main gates and the sentries posted along the perimeter. His voice is barely a whisper.

“You see that?” he murmurs, pointing to a series of small posts along the wall where guards stand watch. “They don’t stay still for long. These guards rotate every few hours. It’s not just the main gates we have to worry about. It’s the back alleys and hidden passages.”

He shifts, motioning for you to follow. “If we plan to go during the day, we’ll need more than just blades. We’ll need something with a little more punch. On top of that, we will probably need to expect a few from them as well. The guards are too alert during the daylight, but with the right materiels, we can make it work."

You nod, taking mental notes. More than just blades—something heavier.

“If we try the night,” The King continues, “they’ve been moving some guards into the passages just outside the walls, possibly to prevent people from sneaking in. We’ll need to be fast—extra quick on our feet. And when we get close, we’ll have to be quiet as ghosts.” He pauses, eyes flicking around the darkening streets. "You’ll need to keep your head down, especially if they start closing in."

You take a deep breath, your mind racing with possibilities.

* [ Check the Entrace to the underground passages ] -> passage_check
* [Head back to Camp] ->tonight
-> END

== passage_check == 

" We should probably go ahead and check on the Passageways entry before we head back. So we can tell the others if its an option or not." 
The King nods in agreement 
The King leads you away from the walls and deeper into the narrow streets.There’s one last thing you need to check before making your final decision: the entrance to the rumored underground tunnels that could offer a hidden way into the palace.

The King motions for you to follow, his pace quickening as he takes a sharp turn down a narrow alley. If this route’s still viable, it could be the cleanest way in, out of sight from the guards.

You reach a small, rusted iron door, half-concealed by ivy and rubble. The King kneels down, running his gloved fingers over the edges, testing for any signs of weakness in the lock. His brow furrows as he traces the edges of the door, but then he suddenly stills, a sharp look crossing his face.

“What’s wrong?” you whisper, moving closer.

“The scent of metal,” he murmurs, “And... movement.” He lifts his head. Just beyond the threshold, in the dim light, you catch a glimpse of polished armor. A Knight’s outpost—two armored figures standing guard, weapons drawn, pacing in slow, deliberate circles. They’re stationed here, watching over the tunnels, making sure no one enters. It’s obvious now that the tunnels have been locked down since the last time you heard about them.

The King shifts back, motioning you to step away. His voice is low, almost a growl. “Looks like Option Three is off the table.” He’s silent for a moment, his eyes darting from the knights to the walls of the alleyway. “We’ll have to go another way.”

You’re left with the remaining two options—the daylight strike, or the chaos of the night.

* [Go back to camp] -> tonight
-> END

== storage_tent ==

{Name("")}{Icon("Empty_Character")}The canvas flap of the Midnight Syndicate storage tent rustles as you push it open.
Inside, the air smells of leather, oil, and something faintly metallic. 
The tent is dimly lit by lanterns hung from the ceiling, casting a warm glow over rows of weapons and armor from past heists. 
Each piece tells a story—a jagged sword with a chipped hilt, a bowstring worn thin from overuse, and plates of armor dented from too many close calls. It’s a treasure trove of danger, a reminder of just how high the stakes are.
You step deeper inside, eyes scanning the shelves and racks, your fingers brushing over the cold steel and worn leather. 
The Midnight Syndicate has always kept the best of the loot for themselves, and tonight, you’re choosing what you’ll need for the heist.

* [Look further]-> shelves

== shelves ==

You step deeper inside, eyes scanning the shelves and racks, your fingers brushing over the cold steel and worn leather. 
The Midnight Syndicate has always kept the best of the loot for themselves, and tonight, you’re choosing what you’ll need for the heist.

Ahead, a weapons rack catches your eye. You see a sharp sword, its edge glinting in the lantern light. It’s well-balanced, a perfect weapon for close combat, but it’s heavy—maybe a bit too heavy for quick maneuvers.

On the opposite side, a finely crafted bow with a set of arrows rests against a rack. Its wood is smooth, and the string taut. It would let you strike from a distance, silent and swift, but you’ll need steady hands and nerves of steel to pull it off in the heat of the moment.

* [Take the Sword] -> sword_pickup
* [Take the Bow]-> bow_pickup

-> END

== Shelves_2 == 

Next, your gaze shifts to the armor section. A pair of arm cuffs gleams in the light, perfectly shaped to protect your wrists without restricting your movements. It would be ideal for close combat and blocking strikes. 

But beside them, a new pair of boots catches your attention. They’re made from soft leather, durable yet lightweight—perfect for quiet steps and fast escapes.

* [Pick the Arm Cuffs] -> cuff_pickup
* [Put on the boots] -> boot_pickup
-> END

== Shelves_3 ==

Lastly, tucked into a corner on a wooden shelf, a health potion sits, the glass bottle glowing faintly. It’s a little on the pricey side, but it could save your life if things go sideways.

* [Take the potion ] -> potion_pickup
* [Leave the potion] -> leave_potion
-> END

== sword_pickup ==

You now have a sword! Be wise where you swing. 
~ Items = Items + 1
~ Sword = Sword + 1 
~ Damage = Damage + 2
* [Continue looking through tent] -> Shelves_2

== bow_pickup ==

You now have a Bow! Be wise where you aim. { King > 0 : The King would be proud. }
~ Items = Items + 1
~ Bow = Bow + 1 
~ Damage = Damage + 1
~ Speed = Speed + 1
* [Continue looking through tent] -> Shelves_2

== cuff_pickup ==

You lace the Arm Cuffs tightly around your right and left forarms! Better to be safe than sorry.  
~ Items = Items + 1
~ Cuffs = Cuffs + 1 
~ Defense = Defense + 2
* [Continue looking through tent] -> Shelves_3

== boot_pickup ==

You lace the Boots nice and tight. As you get to your feet you can feel yourself more sure in your steps.
~ Items = Items + 1
~ Speed = Speed + 2 
~ Boots = Boots + 1
* [Continue looking through tent] -> Shelves_3

== potion_pickup ==

You pick up the small glass bottle and hold it close to your face to inspect it closer. It glows a warm red and bubbles just above its surface. 

Might come in handy. { Bachita > 0 : I should probably ask Bachita what it is before I go drinking it myself. }

~ Items = Items + 1
~ Potion = Potion + 1 
* [Continue looking through tent] -> gathering_end

== leave_potion ==

After glaring at the potion for what seemed like hours, you decide to leave it where it sits in its wooden home. 

* [Continue looking through tent] -> gathering_end

== gathering_end ==

You know the risks of this heist, and the supplies you choose could be the difference between success or falling short.

* [Leave the Storage Tent] -> tonight

-> END


== Leader ==

{Name("")}{Icon("Empty_Character")}It is { advance_time () }

{Name("Vera")}{Icon("Vera")}You enter the dimly lit tent, the familiar scent of smoke and leather greeting you. The leader of the Midnight Syndicate, an imposing figure known only as Vera, sits at a large wooden table, surrounded by maps and documents. She doesn’t look up immediately, her fingers tapping rhythmically against the surface. After a moment, her piercing gaze locks onto you, and the rest of the team shifts uneasily behind you.

“So,” she starts, her voice low and steady, “which plan are we going with?”

* { Option < 0 }  [ The Daylight Heist ] -> option1

* { Option > 0 } [ The Moon Festival Heist ] -> option2

-> END

== option1 ==

You take a deep breath, weighing your words carefully. 

“We’re going for it during the day.” Vera’s eyes narrow slightly as she listens, then she nods slowly. 
"A risky move," she muses. "But it could work if we’re prepared. Daylight is not our friend, so you’ll need more than just a blade. If you're planning to go in when the sun’s high, you’ll need something heavy—something that’ll give you the advantage against more guards. A sword, or something with a bit more reach.” She stands, walking over to a nearby chest where weapons are stacked high. 
“I recommend armor that’s durable but not too heavy—something that'll protect you but still let you move. Too light, and you’ll be vulnerable. Too heavy, and you’ll be slow.” She looks back over her shoulder. 
“We’ll also need distractions, diversions. A fight at the wrong time, and we’re done. Make sure your gear’s up to the task. You don’t want to be caught unprepared.” She turns back to face you, her eyes calculating. 
“Now, show me what you’ve got. Let’s see your haul from the loot tent.”

* [ Show Vera what youve collected ] -> Stat_Check 

== option2 ==

You give Vera a sharp nod, your decision clear.

"We’re going under the cover of night."

Vera’s lips curl into a faint, approving smile.
"Better. Less risk of running into too many guards. But the night’s no friend to anyone carrying heavy gear. You’ll need to travel light—move fast, stay quiet. Don’t load up on armor you don’t need. Focus on staying nimble." 
She pauses, eyeing the others. 
"But don’t forget, you’ll still need a weapon. A quick blade, something you can use in the shadows. And your shoes—check your boots, and make sure they’re tight. If we’re caught, we’ll need to run, and you don’t want to be slowed down by loose laces or worn leather.”

She paces around the table, eyes flicking back to you.
“Speed is key. Don’t carry anything you’re not willing to leave behind. And remember—no noise. We can’t afford to get caught.”

She steps closer, her gaze intense. “Now, show me what you’ve picked from the loot tent. Let’s make sure you’re ready.” 

* [ Show Vera what you collected ] -> Stat_Check

-> END

== Stat_Check == 

You have {Speed} Speed out of 5 .
You have {Damage} Strength out of 5.
You have {Defense} Defense out of 5 .

You have { Items } Items.
With you, you have {Sword > 0 : A sword. { Sword } }
{Bow > 0 : A bow { Bow } }
{Boots > 0 : A pair of boots {Boots}}
{Cuffs > 0 : A set of arm cuffs {Cuffs}}
{ Potion > 0 : And a unknown Potion { Potion }}

* [ Look to Vera for advice ] -> leader2

->END

== leader2 ==

Vera’s eyes scrutinize each item, her expression unreadable. After a few moments of silent inspection, she finally speaks.

"Good. We’re almost ready," she says, her voice low but filled with a quiet determination. "But you need to remember one thing—this heist will test you. No one walks away unscathed. If you want to survive, you need to stay sharp, stay focused, and stick to the plan."

She pauses, then adds with a grim smile, “But, you’ve got the Midnight Syndicate behind you. Every step of the way" 

* [Thank Vera and get some rest before tomorrow. ] -> bedtime

-> END

== bedtime ==

You nod trying to hide the joy you felt in her approval. You turn to face your team and gesture for the way out. 
You slip into the team’s tent, the quiet hum of the camp surrounding you. The others settle in, but sleep feels distant. 
Tomorrow’s the big day—the heist, the risk, everything on the line. You close your eyes, trying to silence the noise in your head. Rest is all you can do now.

Tomorrow will decide it all.

* [ The day of the Heist ] -> heist_day

-> END

== heist_day ==

It is the { advance_time () }
On { advance_day () } the day of Moon Festival.

The first light of dawn filters through the tent. You wake, heart racing, the weight of the day ahead pressing down. Pipsqueak stretches, yawning. 
“Today’s the day,” he mutters. Bachita silently ties her braid, her mask already on. 
The King sits up, eyes steady. “Ready?”

You nod, the air thick. It’s time.

* [ The day ahead ] -> daytime

-> END

== daytime == 

The day before the heist is a blur of final preparations. You gather the team in the late afternoon, each member focused and ready. The air is thick with anticipation, the streets bustling with the growing excitement of the Moon Festival. The city’s energy is palpable, but for you and your crew, there’s no time to indulge in the celebrations.

You head out for one last scout, moving through the alleys and shadows as the sun dips lower in the sky. The King, ever sharp-eyed, spots the last of the guards rotating their posts near the palace walls. Pipsqueak, standing tall and quiet as always, watches for any signs of movement, his presence a silent assurance of strength. Bachita, agile as ever, keeps an eye on the rooftops, her every movement fluid and calculated.

The plan is almost set, but the weight of the unknown hangs over the team. With the festival set to start soon, the city will become a maze of distractions—perfect for slipping in, but fraught with risk.

As night falls, you return to the camp, your heart pounding. The final decision has been made, the team ready. All that’s left is to rest, for tomorrow—the heist—will begin as the moon rises.

* [The moon rises]

-> End


== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 2:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "Morning"
        
        - time == 1:
            ~ return "Noon"
        
        - time == 2:
            ~ return "Night"
    
    }
    
    
        
    ~ return time
    
    == function advance_day ==

    ~ day = day + 1
    
       
    {
        - day > 3:
            ~ day = End
    }
    
    
    {    
        - day == 0:
            ~ return "Thursday"
        
        - day == 1:
            ~ return "Friday"
        
        - day == 2:
            ~ return "Saturday"
        
        - day == 3:
            ~ return "End"
}
    
    
    == End == 
    There will be a part two of this as a passion project!!
    ->END
 All that’s left is to rest, for tomorrow—the heist—will begin as the moon rises.

* [The moon rises]

-> End


== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 2:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "Morning"
        
        - time == 1:
            ~ return "Noon"
        
        - time == 2:
            ~ return "Night"
    
    }
    
    
        
    ~ return time
    
    == function advance_day ==

    ~ day = day + 1
    
       
    {
        - day > 3:
            ~ day = End
    }
    
    
    {    
        - day == 0:
            ~ return "Thursday"
        
        - day == 1:
            ~ return "Friday"
        
        - day == 2:
            ~ return "Saturday"
        
        - day == 3:
            ~ return "End"
}
    
    
    == End == 
    There will be a part two of this as a passion project!!
    ->END
