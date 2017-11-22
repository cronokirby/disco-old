module Network.Disco.Types () where

import           Control.Exception (Exception)


-- | Represents the errors that can be raised by the Discord API.
data DiscordError
    = UnknownAccount
    | UnknownApplication
    | UnknownChannel
    | UnknownGuild
    | UnkownIntegration
    | UnknownInvite
    | UnkownMember
    | UnkownMessage
    | UnkownOverwrite
    | UnkownProvider
    | UnkownRole
    | UnkownToken
    | UnkownUser
    | UnkownEmoji
    | NoBotsAllowed -- ^ Bot accounts can't use this endpoint
    | OnlyBotsAllowed -- ^ Only bots can use this endpoint
    | MaxGuildsReached -- ^ The max number of guilds reached (100)
    | MaxFriendsReached -- ^ The max number of friends reached (1000)
    | MaxPinsReached -- ^ The max number of pinned messages reached (50)
    | MaxGuildRolesReached -- ^ The max number of guild roles reached (250)
    | TooManyReactions
    | MaxGuildChannelsReached -- ^ The max number of guild channels reached (500)
    | Unauthorized
    | MissingAccess
    | InvalidAccountType
    | NotDMChannel -- ^ This action can't be executed on a DM channel.
    | WidgetDisabled
    | CantEdit -- ^ Indicates that the message couldn't be edited because it came from another user
    | EmptyMessage -- ^ Can't send empty messages
    | CantSendToUser -- ^ Can't send messages to this user
    | CantSendToVoice -- ^ Can't send messages to a voice channel
    | VerificationLevelTooHigh -- ^ The verification level in a channel is too high
    | MissingPermissions -- ^ Missing permissions for this action
    | InvalidAuthToken -- ^ The authorization token is invalid
    | NoteTooLong -- ^ The note is too long
    | WrongDeleteRange -- ^ The number of messages to delete was not between 2 and 99
    | CantPinMessage -- ^ A message couldn't be pinned because it was not sent in that channel
    | CantExecuteSystemMessage -- ^ Can't execute action on a system message
    | MessageTooOld -- ^ Message was too old to bulk delete
    | BadInviteAccepted -- ^ An invite was accepted to a guild the application's bot is not in
    | ReactionBlocked -- ^ A reaction was blocked
    deriving (Show)

instance Exception DiscordError
