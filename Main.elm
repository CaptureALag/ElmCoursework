import Html exposing (Html, node, div, button, text, nav, a)
import Html.Attributes exposing (class, classList, href, rel)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (onClick)
import Dict exposing (Dict)
import ContentLayout exposing (renderLayout)
import Models exposing (..)

import Debug

main =
  beginnerProgram { model = 
    { appState =
        { selectedNavIcon = 
            "icon-navigation"

        , currentRoute = MenuPage

        , currentSortOption = Popularity
        , currentSortOrder = Desc
        , currentPage = 1
        , currentFilterByCountry = Nothing
        }
    , appContent =         
        { countries = 
            [ { id = "cyprus"
              , name = "Кіпр"
              , nameLocativeCase = "Кіпр" 
              },
              { id = "ibiza"
              , name = "Ібіца"
              , nameLocativeCase = "Ібіцу" 
              },
              { id = "malta"
              , name = "Мальта"
              , nameLocativeCase = "Мальту" 
              },
              { id = "crit"
              , name = "Крит"
              , nameLocativeCase = "Крит" 
              }
            ]
        , hotels =
            [
              { id = "cassandra-mare"
              , name = "Cassandra Mare"
              , popularity = 1
              , countryId = "malta"
              , stars = 5
              , bgPhotoUrl = "bg_1.jpg"
              , photoUrls = []
              , priceOptions = 
                  [ 
                    { name = "OB"
                    , personCapacity = 1
                    , price = 400
                    },
                    { name = "BB"
                    , personCapacity = 1
                    , price = 550
                    },
                    { name = "OB"
                    , personCapacity = 2
                    , price = 600 
                    }, 
                    { name = "ALL"
                    , personCapacity = 2
                    , price = 1000
                    }
                  ]   
              , duration = 6
              , depart = "14.08.2017"

              , videoUrl = Just "https://www.youtube.com/embed/1tP2INzqnaQ"

              , description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquet lobortis turpis, nec suscipit diam. Nulla facilisi. Nunc varius nunc sit amet metus faucibus iaculis. Maecenas faucibus condimentum urna, sit amet placerat velit blandit in. Sed tincidunt, est et porta tincidunt, purus augue porttitor velit, et egestas odio est a dui. Integer tincidunt consequat ante nec vehicula. Etiam vehicula diam ipsum, lobortis mattis odio dapibus ac. Nam elementum lobortis ligula, vel pharetra nunc rutrum eu. Duis commodo convallis elit elementum viverra. Nam dapibus ex quis auctor volutpat."

              , features = 
                  [ "Vivamus at felis quis massa hendrerit rutrum."      
                  , "Aliquam erat sem, congue et elementum in, pretium eu eros."
                  , "Suspendisse potenti. Quisque arcu ipsum, pulvinar quis pulvinar feugiat, aliquam ac turpis."
                  , "Fusce rhoncus massa lorem. Etiam feugiat magna aliquet arcu vehicula, vel laoreet enim tincidunt."
                  ]

              , postDescription = "In eget cursus leo. Sed a ex ex. Nam sit amet est iaculis, maximus magna eu, porta metus. Sed eu ex finibus, rhoncus lectus sit amet, facilisis eros. Pellentesque id ipsum rhoncus, pulvinar justo id, lobortis nisl. Curabitur porttitor mi nibh, sit amet iaculis neque iaculis bibendum. Praesent consectetur mi a magna dapibus, sed placerat lacus interdum. In egestas vel tellus eget tincidunt. Curabitur eros nisi, bibendum a lorem vitae, vehicula interdum ipsum. Sed quis egestas ex."
              },  
              { id = "akrathos-hotel"
              , name = "Akrathos Hotel"
              , popularity = 2
              , countryId = "ibiza"
              , stars = 4
              , bgPhotoUrl = "bg_2.jpg"
              , photoUrls = []
              , priceOptions = 
                  [ 
                    { name = "OB"
                    , personCapacity = 1
                    , price = 200
                    },
                    { name = "BB"
                    , personCapacity = 1
                    , price = 250
                    },
                    { name = "OB"
                    , personCapacity = 2
                    , price = 300 
                    }, 
                    { name = "ALL"
                    , personCapacity = 2
                    , price = 800
                    }
                  ]
              , duration = 5    
              , depart = "8.08.2017"

              , videoUrl = Nothing

              , description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquet lobortis turpis, nec suscipit diam. Nulla facilisi. Nunc varius nunc sit amet metus faucibus iaculis. Maecenas faucibus condimentum urna, sit amet placerat velit blandit in. Sed tincidunt, est et porta tincidunt, purus augue porttitor velit, et egestas odio est a dui. Integer tincidunt consequat ante nec vehicula. Etiam vehicula diam ipsum, lobortis mattis odio dapibus ac. Nam elementum lobortis ligula, vel pharetra nunc rutrum eu. Duis commodo convallis elit elementum viverra. Nam dapibus ex quis auctor volutpat."

              , features = 
                  [ "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."      
                  , "Donec sit amet sem vulputate neque tempor elementum."
                  , "Maecenas congue, tortor ut fringilla interdum, erat metus accumsan ligula, at faucibus augue lorem sed ante."
                  , "Pellentesque pharetra luctus velit imperdiet lobortis. Praesent rutrum condimentum tempus."
                  ]

              , postDescription = "In eget cursus leo. Sed a ex ex. Nam sit amet est iaculis, maximus magna eu, porta metus. Sed eu ex finibus, rhoncus lectus sit amet, facilisis eros. Pellentesque id ipsum rhoncus, pulvinar justo id, lobortis nisl. Curabitur porttitor mi nibh, sit amet iaculis neque iaculis bibendum. Praesent consectetur mi a magna dapibus, sed placerat lacus interdum. In egestas vel tellus eget tincidunt. Curabitur eros nisi, bibendum a lorem vitae, vehicula interdum ipsum. Sed quis egestas ex."


              },
              { id = "alara-hotel"
              , name = "Alara Hotel"
              , popularity = 3
              , countryId = "cyprus"
              , stars = 3
              , bgPhotoUrl = "bg_3.jpg"
              , photoUrls = []
              , priceOptions = 
                  [ 
                    { name = "OB"
                    , personCapacity = 1
                    , price = 150
                    },
                    { name = "BB"
                    , personCapacity = 1
                    , price = 250
                    },
                    { name = "OB"
                    , personCapacity = 2
                    , price = 300 
                    }, 
                    { name = "ALL"
                    , personCapacity = 2
                    , price = 600
                    }
                  ]  
              , duration = 4
              , depart = "24.08.2017"

              , videoUrl = Nothing
 
              , description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquet lobortis turpis, nec suscipit diam. Nulla facilisi. Nunc varius nunc sit amet metus faucibus iaculis. Maecenas faucibus condimentum urna, sit amet placerat velit blandit in. Sed tincidunt, est et porta tincidunt, purus augue porttitor velit, et egestas odio est a dui. Integer tincidunt consequat ante nec vehicula. Etiam vehicula diam ipsum, lobortis mattis odio dapibus ac. Nam elementum lobortis ligula, vel pharetra nunc rutrum eu. Duis commodo convallis elit elementum viverra. Nam dapibus ex quis auctor volutpat."

              , features = 
                  [ "Suspendisse volutpat at odio sed dignissim."      
                  , "Donec sit amet sem vulputate neque tempor elementum."
                  , "Sed nec lorem eu felis fringilla faucibus."
                  , "Pellentesque pharetra luctus velit imperdiet lobortis. Praesent rutrum condimentum tempus."
                  ]

              , postDescription = "In eget cursus leo. Sed a ex ex. Nam sit amet est iaculis, maximus magna eu, porta metus. Sed eu ex finibus, rhoncus lectus sit amet, facilisis eros. Pellentesque id ipsum rhoncus, pulvinar justo id, lobortis nisl. Curabitur porttitor mi nibh, sit amet iaculis neque iaculis bibendum. Praesent consectetur mi a magna dapibus, sed placerat lacus interdum. In egestas vel tellus eget tincidunt. Curabitur eros nisi, bibendum a lorem vitae, vehicula interdum ipsum. Sed quis egestas ex."



              },
              { id = "boumerang"
              , name = "Boumerang"
              , popularity = 4
              , countryId = "crit"
              , stars = 4
              , bgPhotoUrl = "bg_4.jpg"
              , photoUrls = []
              , priceOptions = 
                  [ 
                    { name = "OB"
                    , personCapacity = 1
                    , price = 200
                    },
                    { name = "BB"
                    , personCapacity = 1
                    , price = 250
                    },
                    { name = "OB"
                    , personCapacity = 2
                    , price = 300 
                    }, 
                    { name = "ALL"
                    , personCapacity = 2
                    , price = 800
                    }
                  ] 
            , duration = 5
            , depart = "21.08.2017"

            , videoUrl = Nothing

            , description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquet lobortis turpis, nec suscipit diam. Nulla facilisi. Nunc varius nunc sit amet metus faucibus iaculis. Maecenas faucibus condimentum urna, sit amet placerat velit blandit in. Sed tincidunt, est et porta tincidunt, purus augue porttitor velit, et egestas odio est a dui. Integer tincidunt consequat ante nec vehicula. Etiam vehicula diam ipsum, lobortis mattis odio dapibus ac. Nam elementum lobortis ligula, vel pharetra nunc rutrum eu. Duis commodo convallis elit elementum viverra. Nam dapibus ex quis auctor volutpat."

            , features = 
                  [ "Suspendisse volutpat at odio sed dignissim."      
                  , "Donec sit amet sem vulputate neque tempor elementum."
                  , "Sed nec lorem eu felis fringilla faucibus."
                  , "Pellentesque pharetra luctus velit imperdiet lobortis. Praesent rutrum condimentum tempus."
                  ]

            , postDescription = "In eget cursus leo. Sed a ex ex. Nam sit amet est iaculis, maximus magna eu, porta metus. Sed eu ex finibus, rhoncus lectus sit amet, facilisis eros. Pellentesque id ipsum rhoncus, pulvinar justo id, lobortis nisl. Curabitur porttitor mi nibh, sit amet iaculis neque iaculis bibendum. Praesent consectetur mi a magna dapibus, sed placerat lacus interdum. In egestas vel tellus eget tincidunt. Curabitur eros nisi, bibendum a lorem vitae, vehicula interdum ipsum. Sed quis egestas ex."

            }
            ]
        }
    }
    , view = view, update = update }

{- countriesToLinks : List Country -> List (Html msg) 
countriesToLinks = List.map (\country -> a [href ("/"++country.id)] [text ("Тури на " ++ country.nameLocativeCase)])


viewRightBlock : Model -> Html Msg
viewRightBlock model = 
  nav []
     (countriesToLinks model.countries)        
-}

view : Model -> Html Msg
view model =
  div []
    [(renderLayout (\x -> text "") model)]

updateAppState : (AppState -> AppState) -> Model -> Model
updateAppState f model =
  let appState = model.appState
  in {model | appState = f appState}


update : Msg -> Model -> Model
update msg =
  case msg of
    (Models.NavIconClick iconClass) ->
      updateAppState (\st -> { st | selectedNavIcon = iconClass } )
    (SortOptionSelect opt ord) ->
      updateAppState (\st -> { st | currentSortOption = opt , currentSortOrder = ord})
    (RouteChange route) ->
      updateAppState (\st -> { st | currentRoute = route})
    LogoClick ->
      updateAppState (\st -> { st | currentRoute = MenuPage, currentFilterByCountry = Nothing, currentSortOption = Popularity, currentSortOrder = Desc, currentPage = 1 })
    SetFilterByCountry country ->
      updateAppState (\st -> { st | currentFilterByCountry = country})
