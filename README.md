# Video Game Tracker

A CLI Ruby app to track the Games you Have and the ones you Want

## Project Vision

This will be a small command-line program that asks the user about the games they have/want.

Users will be able to CRUD a game in the list. The user will also be able to create lists of the games they already own or ones they would like.

## Features

### List out games

The user will be able to print out lists of either games they already own or ones they want.
Games will list:
 * What systems they can be played on (1 or more Wii, XBox, iOS...)
 * There age rating
 * Can Play Online/MultiPlayer

*** Start ***
Usage Example:
    > ./video_game_tracker
    1.List Owned Games - owned
    2.List Wanted Games - wanted
    3.Manage DB - manage
    4.Exit

    > 1

    1. Temple Run                         10+ E - Everyone 10+, Single Player, iOS (iPad or iPhone)
    2. Candy Crush                        E - Everyone, Single Player, iOS (iPad or iPhone)
    3. Where’s my Water                   E - Everyone, Single Player, iOS (iPad or iPhone)
    4. Dragonvale                         E - Everyone, MultiPlayer/Online, iOS (iPad or iPhone)
    5. Guitar Hero III - Legends of Rock  T - Teen, MultiPlayer/Online, Play Station 3
    .
    .

Acceptance Criteria:

  * The Program will print out either list upon entering the corresponding number, or by typing "video_game_tracker owned" or "video_game_tracker wanted"

### Add new games

Users will spend their Allowance to buy more games. We will be able to add these to the DB. This option is only available through the "manage" menu.

** Add A Game **
Usage Example
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

    > 7

    Returned
    1.Enter Another Game System
    2.Next Step

    > 2

    Enter Game Maturity Rating
    1.eC - Early Childhood
    2.E - Everyone
    3.10+ E - Everyone 10+
    4.T - Teen
    5.M - Mature 17+
    6.Ao - Adults Only 18+
    7.RP - Rating Pending

    > 2

    Enter Game Player Style
    1.Single Player
    2.MultiPlayer
    3.MultiPlayer/Online

    > 3

    Ownership Status
    1.Owned
    2.Wanted

    > 1

    ($..return to previous menu)
Acceptance Criteria:

  * The user will have to enter the game name
  * The user will be walked through the questions. Since a single Game can be used across multiple systems then that particular question loops until you choose to go forward.

### Update games

Users might already own the the game in App version on a tablet. They might decide to purcahse the game for their game console which is attached to a TV or Monitor. They will be able to update that game in the DB with the addition on the new system which it can be played on.

Games that where on the "Wanted" list may be purchased eventually. We will be able to update that Own/Want status.

** Update A Game **
Usage Example
    > 2
    Update A Game
    1.Enter Game Name
    2.List All Games  ## Will return back to this menu
    3.Exit

    > 1

    > 1
    Editing #{GAME NAME}
    1.Edit Name
    2.Edit System Type
    3.Edit Maturity Rating
    4.Edit Player Style
    5.Ownership Status
    6.Exit

    > 5

    > 1 "Edit name"
    The Game Name Is #{GAME NAME}, change to..

    ($..return to previous menu)

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

    (Loop - System types are #{1.WiiU 2.XBox 360 3.iOS ... })

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

    ($..return to previous menu)

    4. "Edit Player Style"
    > 4
    The Player Style is #{PLAYER STYLE}, Change To The Following
    1.Single Player
    2.MultiPlayer
    3.MultiPlayer/Online

    5. Ownership Status
    > 5
    The game is current status is #{OWNER STATUS}, Change To The Following
    1.Owned
    2.Wanted

    > 1

    ($..return to previous menu)

Acceptance Criteria:

  * The user will have to enter the game name
  * The user will be walked through the questions.

### Delete games

Users can trade games with their friends, sale them on VarageSale, trade at GameStop, or they can be taken away by their parents when they cross the wrong line. They will be able to remove these games from the DB.

** Delete A Game **
Usage Example
    > 3
    Delete A Game
    1.Enter Game Name
    2.List All Games  ## Will return back to this menu
    3.Exit

    > 1
    Game Name
    #{GAME NAME}
    Are you sure you want to delete? (y/n)

    ($..return to previous menu)

Acceptance Criteria:

  * The user will have to enter the game name
  * The user will have to verify game deletion


## Import CSV list of existing games already owned

The user already has a list of the current games they already own. They can place these in CSV format so that they can be quickly imported into the database.


https://www.gliffy.com/go/html5/8048441?app=1b5094b0-6042-11e2-bcfd-0800200c9a66
