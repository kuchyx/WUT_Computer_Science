#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>
#include <math.h>
#include <ctype.h>
#include "userinteraction.c"
#include "placement.c"
#include "movement.c"
#include "command_line_parameters.c"
#include "game_struct.h" // Header file for file where we store all our structures
#include <windows.h>
//#define INTERACTIVE
#define AUTOMATIC

int interactive_mode(GameState Game)
{
    printf("Hello again! Please enter the number of rows and columns \n");
    scanf("%d", &Game.board_width);
    scanf("%d", &Game.board_height);
    // User enters values to the Game structure
    // User Interaction - Telling user to input rows and columns
    // Creating a board for our game using Field structure
    Game.board = allocateMemory(Game);
    Game.board = randomizeFields(Game);

    // Changed variables we use to Game structure and board
    Game.player_data[0].player_number = 1;
    Game.player_data[1].player_number = 2;
    Game.player_data[0].score = 0;
    Game.player_data[1].score = 0;

    printBoard(Game);
    Game.one_fish_fields = checkPlacement(Game);
    Game.penguins_per_player = floor(Game.one_fish_fields / 2);
    Game.current_player = 1;


    printf("================================\n");
    printf("\tPLACEMENT PHASE!\n");
    printf("================================\n");
    for(int i = 0; i < 2 * Game.penguins_per_player; i++)
    {
        while(!placePenguin(&Game));
        system("clear || cls");
        printBoard(Game);
        Game.current_player = (i + 1) % 2 + 1;

    }
    system("clear || cls");
    printBoard(Game);
    Game.current_player = 1;
    Game.flag = 0;
    while(Game.flag != 2)
    {
        if(movePenguin(&Game))
        {
            system("clear || cls");
        }
        printBoard(Game);
    }
    if(Game.player_data[0].score > Game.player_data[1].score)
    {
        printf("Player ONE won!\n");
    }else if(Game.player_data[0].score < Game.player_data[1].score)
    {
        printf("Player TWO won!\n");
    }else printf("It's a tie!\n");
    return 0;
}
int main(int argc, char *argv[])
{
    GameState Game;
    #ifdef AUTOMATIC
    printf("Its automatic mode\n");

    if(argc != 1)
    {
         // Creating a Game variable that will hold informations needed to run the program
        Game.command_line = generateCommandLine(Game, argc, argv);  // Generates 2D dynamic array of strings
        handlingParameters(argc, argv, Game);  // Stores all commands inside Game.command_line array
        Game.file_type = 0;  // We use this variable to check if the file we open is inputboardfile or outputboardfile
        Game.phase = 0;  // We use this variable to check if current game phase is placement (1) or movement(2)
        Game.penguins_from_command = 0;  // This variable checks if the user enter number of penguins in placement phase
        Game.check_for_id = 0;  // This variable checks if we got instruction to check id from the command line
        Game.our_player_number = 0;  // This variable will be used to determine our player number based on his ID

        for(int i = 0; i < argc - 1; i++)
        {
            if(checkParameterType(&Game, i) == 0)
            {
                printf("One of the parameters you entered is wrong!\n");
                return 2;
            }  // Inside this loop we run through each command and check what it does and assign proper values from those commands
        }

        if(Game.check_for_id == 0)  // Checks if the commands asked for ID
        {
            if(Game.file_type == 2)  // Checks if we got boards files from the commands
            {
                if(!handleInputFile(&Game))  // handleInputFile returns 1 if something went wrong, this function handles input file
                {
                    printf("Total number of players is %d\n", Game.total_players);
                    if(checkForStrayPenguins(Game) == 1)  // Checks if there are any penguins that don't belong to any player
                    {
                        printf("There is a stray penguin!\n");
                        return 2;
                    }
                    //printBoard(Game);
                    if(Game.phase == 1)
                    {
                        if(Game.penguins_from_command == 0)  // Checks if we got any penguins from command
                        {
                            printf("We didn't get any penguins from command!\n");
                            return 2;
                        }
                        if(Game.penguins == ourPenguins(Game))  // Checks if we put all our penguins
                        {
                            printf("All penguins have been placed");
                            return 1;
                        }else
                        {
                            if(automaticPlacePenguin(&Game) == 0)  // Tries to put penguin somewhere and if unable returns 0
                            {
                                printf("You can't put penguin anywhere!\n ");
                                handleOutPutFile(Game);
                                return 1;
                            }else
                            {
                                printf("Program placed a penguin!");
                                handleOutPutFile(Game);
                                return 0;
                            }
                        }
                    }else if(Game.phase == 2 && Game.penguins_from_command == 0)  // Checks if it is a movement phase
                    {
                        if(checkMove(Game) == 0) // This function checks if there are any moves left for any player
                        {
                            printf("All penguins are blocked! ");
                            handleOutPutFile(Game);
                            return 1;
                        }else
                        {
                            automaticMovePenguin(&Game);  // Moves our penguin automatically
                            handleOutPutFile(Game);
                            return 0;
                        }
                    }else
                    {
                        printf("You entered number of penguins even though it is a movement phase!\n");
                        return 2;
                    }
                }else
                {
                    printf("There is a mistake in board file! ");   // type of mistake is printed out in handleInputFile function
                    fclose(Game.input_board);
                    return 2;
                }
            }else if(Game.file_type == 1)
            {
                printf("You entered input board file name but did not enter output board file name!");
                return 2;
            }else if(Game.phase != 0)
            {
                printf("You did not enter input board file and output board file");
                return 2;
            }

            printf("Our player number is: %d\n", Game.our_player_number);
            printf("Everything went great");

        }else
        {
            printf("marcel");
            return 0;
        }
    }else
    {
        printf("You entered too few arguments! ");
        return 2;
    }
    return 2137;
    #endif
    #ifdef INTERACTIVE
    welcome(); // User interaction - showing communicate at the start of the program
    interactive_mode(Game);
    return 0;
    #endif // INTERACTIVE
}
