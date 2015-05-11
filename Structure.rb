
*** Start ***
Usage Example:
> ./video_game_tracker help
1.List Owned Games - owned
2.List Wanted Games - wanted
3.Manage DB - manage
4.Exit

*** Manage ***
> ./video_game_tracker manage
1.Add A Game
2.Update A Game
3.Delete A Game
4.List All Games  ## Will return back to this menu
5.Exit

** Add A Game **
> 1
Enter Game Name..

Enter Game System Type By Choosing One Of The Following
1.Wii U
2.XBox 360
3.Play Station 3
4.iOS (iPad or iPhone)
5.Windows OS
6.Mac OS X
7.Nintendo DS
8.Wii

Returned
1.Enter Another Game System
2.Next Step

Enter Game Maturity Rating
1.eC - Early Childhood
2.E - Everyone
3.10+ E - Everyone 10+
4.T - Teen
5.M - Mature 17+
6.Ao - Adults Only 18+
7.RP - Rating Pending

Enter Game Player Style
1.Single Player
2.MultiPlayer
3.MultiPlayer/Online

$..return to previous menu

** Update A Game **
> 2
Update A Game
1.Enter Game Name
2.List All Games  ## Will return back to this menu
3.Exit

> 1
Editing #{GAME NAME}
1.Edit Name
2.Edit System Type
3.Edit Maturity Rating
4.Edit Player Style
5.Exit

> 1 "Edit name"
The Game Name Is #{GAME NAME}, change to..
$..return to previous menu

2. "Edit System Type"
> 2
System types are #{1.WiiU 2.XBox 360 3.iOS ... }
1.Add New
2.Select number to Delete
3.Return to Previous Menu

> 1 "Add New"
Choose a number for the new System to add the System Type:
1.Wii U
2.XBox 360
3.Play Station 3
4.iOS (iPad or iPhone)
5.Windows OS
6.Mac OS X
7.Nintendo DS
8.Wii


Loop - System types are #{1.WiiU 2.XBox 360 3.iOS ... }

3. "Edit Maturity Rating"
> 3
The Maturity Rating is #{MATURITY RATING}, Change To The Following
1.eC - Early Childhood
2.E - Everyone
3.10+ E - Everyone 10+
4.T - Teen
5.M - Mature 17+
6.Ao - Adults Only 18+
7.RP - Rating Pending

$..return to previous menu

4. "Edit Player Style"
> 4
The Player Style is #{PLAYER STYLE}, Change To The Following
1.Single Player
2.MultiPlayer
3.MultiPlayer/Online

$..return to previous menu

** Delete A Game **
> 3
Delete A Game
1.Enter Game Name
2.List All Games  ## Will return back to this menu
3.Exit

> 1
Game Name
#{GAME NAME}
Are you sure you want to delete? (y/n)

$..return to previous menu





