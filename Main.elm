module Main exposing (main)

import Quiz exposing (update, view, Question, Model)
import Array
import Html exposing (Html)
import Html.App exposing (beginnerProgram)
import Markdown
import Random
import Random.Array


-- True is CUB, False is Other.
-- I haven’t vetted the practices of all other examples yet,
-- but just list the main competitor to each CUB product,
-- or another (preferably Australian) beer if no direct competitor.


questions : List Quiz.Question
questions =
    [ ( True, "Abbotsford Invalid Stout" )
    , ( False, "4 Pines Stout" )
    , ( True, "Carlton Cold" )
    , ( False, "Coopers Pale Ale" )
    , ( True, "Carlton Draught" )
    , ( False, "Little Creatures Pale Ale" )
    , ( True, "Carlton Dry" )
    , ( False, "Tooheys Extra Dry" )
    , ( True, "Crown Lager" )
    , ( False, "Mornington Peninsula Lager" )
    , ( True, "Cascade Premium Light" )
    , ( False, "Coopers Clear" )
    , ( True, "Fat Yak" )
    , ( False, "James Squire 150 Lashes Pale Ale" )
    , ( True, "Foster's Lager" )
    , ( False, "James Boag's Premium" )
    , ( True, "Great Northern Super Crisp" )
    , ( False, "Stone & Wood Green Coast Lager" )
    , ( True, "Grolsch Premium Lager" )
    , ( False, "Dos Blockos Pale Lager" )
    , ( True, "Matilda Bay Beez Neez" )
    , ( False, "Two Birds Taco" )
    , ( True, "Melbourne Bitter" )
    , ( False, "Brunswick Bitter" )
    , ( True, "Minimum Chips Golden Lager" )
    , ( False, "Robot Ninja Sorachi Lager" )
    , ( True, "Peroni Nastro Azzuro" )
    , ( False, "James Squire Sundown Lager" )
    , ( True, "Pure Blonde" )
    , ( False, "Hahn SuperDry" )
    , ( True, "Sheaf Stout" )
    , ( False, "Mornington Russian Imperial Stout" )
    , ( True, "Victoria Bitter (VB)" )
    , ( False, "Tooheys New" )
    , ( True, "Bulmers" )
    , ( False, "Magners" )
    , ( True, "Dirty Granny" )
    , ( False, "5 Seeds Crisp Apple" )
    , ( True, "Mercury Draught Cider" )
    , ( False, "Monteith’s Crushed Apple Cider" )
    , ( True, "Strongbow" )
    , ( False, "The Hills Cider" )
    ]


shuffleListToArray : List ( Bool, String ) -> Array.Array Quiz.Question
shuffleListToArray list =
    fst (Random.step (Random.Array.shuffle (Array.fromList list)) (Random.initialSeed 204862737))


instructionsComponent : Html a
instructionsComponent =
    Markdown.toHtml [] """

# CUB or Not

## Why I wanted to learn what products Carlton & United Breweries makes

- [54 workers laid off, then invited to reapply for their old jobs for 65% wage cut.](http://www.theage.com.au/business/workplace-relations/thousands-rally-in-melbourne-for-sacked-beer-workers-20160908-grbi7z.html)

## How to Play

  - A product name will appear.
  - Click *CUB* if you think they made it.
  - Click *Other* if you think they didn't.

## Contribute

- [Github](https://github.com/camjc/cub-or-not)

"""


model : Quiz.Model
model =
    { questionId =
        -1
        -- Show Instructions
    , questions = shuffleListToArray questions
    , correctAnswers = Array.empty
    , wrongAnswers = Array.empty
    , buttonTrue = ( "CUB", "#1d3a73" )
    , buttonFalse = ( "Other", "#00975a" )
    , instructionsComponent = instructionsComponent
    }


main : Program Never
main =
    Html.App.beginnerProgram { model = model, view = view, update = update }
