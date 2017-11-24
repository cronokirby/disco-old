module Network.Disco.Types.Voice
    ( VoiceState(..) )
where

import           Data.Text                  (Text)

import           Network.Disco.Types.Common

-- | Used to represent a user's voice connection status
data VoiceState a = VoiceState
    { voiceStateGuildID   :: a -- ^ This is usually present with a guild snowflake
    , voiceStateChannelID :: !(Snowflake Channel) -- ^ The channel is this user is connected to
    , voiceStateUserID    :: !(Snowflake User) -- ^ The user this voice state is for
    , voiceStateSessionID :: !Text -- ^ The session id for this voice state
    , voiceStateDeaf      :: !Bool -- ^ Whether this user is deafened by the server
    , voiceStateMute      :: !Bool -- ^ Whether this user is muted by the server
    , voiceStateSelfDeaf  :: !Bool -- ^ Whether this user is locally deafened
    , voiceStateSelfMute  :: !Bool -- ^ Whether this user is locally muted
    , voiceStateSuppress  :: !Bool -- ^ Whether this user is muted by the current user
    }
