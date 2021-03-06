module Handler.Manage where

import Import
{- import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3, -}
                              {- withSmallInput) -}

-- This is a handler function for the GET request method on the HomeR
-- resource pattern. All of your resource patterns are defined in
-- config/routes
--
-- The majority of the code you will write in Yesod lives in these handler
-- functions. You can spread them across multiple files if you are so
-- inclined, or create a single monolithic file.
getManageR :: Handler Html
getManageR = do
    articles <- runDB $ selectList [] [Desc ArticleDate]
    defaultLayout $ do
        aDomId <- newIdent
        setTitle "Manage articles"
        $(widgetFile "manage")
