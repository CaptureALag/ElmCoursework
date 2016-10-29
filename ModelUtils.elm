module ModelUtils exposing(..)

import Models exposing(..)
import String exposing(toInt)

import Result exposing(toMaybe)
import Maybe exposing (withDefault)

getHotelsOnCurrentPage : Model -> List Hotel
getHotelsOnCurrentPage model =
   List.take 4
    (
     (case model.appState.currentFilterByCountry of
        Just country -> List.filter(\hotel -> hotel.countryId == country.id)
        Nothing -> identity)

    (((   case model.appState.currentSortOption of
             Popularity -> List.sortBy (.popularity)
             Stars -> List.sortBy (.stars)
             Price -> List.sortBy (getHotelMinPrice)
             Depart -> List.sortBy (\hotel ->
                 case List.map ((withDefault -1) << toMaybe << toInt) (String.split "." hotel.depart) of
                    [d,m,y] -> d + m*31 + y*31*366
                    _ -> -1
             )
     ) >> case model.appState.currentSortOrder of
             Asc -> identity
             Desc -> List.reverse
     )  
        model.appContent.hotels))

sortingOptionLabel : SortOption -> String
sortingOptionLabel opt =
   case opt of
      Popularity -> "Популярністю"
      Stars -> "Кількістю зірок"
      Price -> "Ціною"
      Depart -> "Датою відправлення"

sortingOrderLabel : SortOrder -> String
sortingOrderLabel ord =
   case ord of
      Asc -> "▲"
      Desc -> "▼"

negateSortOrder : SortOrder -> SortOrder
negateSortOrder ord =
   case ord of
      Asc -> Desc
      Desc -> Asc

getHotelMinPrice : Hotel -> Int
getHotelMinPrice hotel =
   Maybe.withDefault -1 (List.minimum (List.map (.price) hotel.priceOptions) )

getHotelFormattedDuration : Hotel -> String
getHotelFormattedDuration hotel =
   "Тривалість: " ++ (toString hotel.duration) ++ " " ++ (
      case hotel.duration of
         4 -> "дні"
         _ -> "днів"

         {- TODO -}       
           
   )
