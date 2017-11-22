module Network.Disco.Types.Common
    ( Channel
    , Snowflake(..)
    , User
    )
where

import           Data.Word (Word64)


newtype Snowflake a = Snowflake Word64

instance Show (Snowflake a) where
    show (Snowflake i) = show i

-- TODO: Fill in these definitions
data User = User
-- TODO: Fill in these definitions
data Channel = Channel
