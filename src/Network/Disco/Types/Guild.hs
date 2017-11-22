module Network.Disco.Types.Guild
    ( Guild(..)
    , VerificationLevel
    )
where

import           Data.Text                  (Text)

import           Network.Disco.Types.Common


-- | Used to tag snowflakes with a flat guild type
data GuildType = GuildType

-- | Represents a guild, or server in discord.
data Guild a = Guild
    { guildID                   :: !(Snowflake GuildType) -- ^ The id of the guild
    , guildName                 :: !Text -- ^ The name of the guild
    , guildIcon                 :: !Text -- ^ A hash string of the guild's icon
    , guildSplash               :: !Text -- ^ A hash string of the guild's splash image
    , guildOwnerID              :: !(Snowflake User) -- ^ The id of the owner of a guild
    , guildRegion               :: !Text -- ^ The voice region of the guild
    , guildAfkChannelID         :: !(Snowflake Channel) -- ^ The id of the afk channel
    , guildAfkTimeout           :: !Int -- ^ The afk timeout, in seconds
    , guildEmbedEnabled         :: !Bool -- ^ Whether or not this guild is embeddable
    , guildEmbedChannelID       :: !(Snowflake Channel)-- ^ The id of the embedded channel
    , guildVerificationLevel    :: !VerificationLevel -- ^ The verification level in the guild
    , guildMessageNotifications :: !MessageNotifications -- ^ The default level of message notification in a guild
    , guildExplicitFilter       :: ! ExplicitContentFilter
    , guildExtra                :: a -- ^ Represents extra content in the guild only present if coming from the cache
    }

-- | Represents the verification level in a guild
data VerificationLevel
    = NoVerification -- ^ No restrictions
    | LowVerification -- ^ Must have verified email account to join
    | MediumVerification -- ^ Must be registered on discord for longer than 5 minutes
    | HighVerification -- ^ Must be a member of the guild for longer than 10 minutes
    | VeryHighVerification -- ^ Must have a verified phone number


-- | Represents the level of message notification in a guild
data MessageNotifications
    = NotifyAllMessages
    | NotifyOnlyMentions


-- | Represents the level of explicit content filtering in a guild
data ExplicitContentFilter
    = ExplDisabled -- ^ No filtering at all
    | ExplMembersWithoutRoles -- ^ Filters out from no roled members
    | ExplAllMembers -- ^ Filters out all explicit content


-- | Represents a role in a guild
data Role = Role
    { roleID          :: !(Snowflake Role) -- ^ The id of this role
    , roleName        :: !Text -- ^ The name of this role
    , roleColor       :: !Int -- ^ The hexadecimal color code for this role
    , roleHoist       :: !Bool -- ^ If this role is pinned in the user listing
    , rolePosition    :: !Int -- ^ The position of this role
    , rolePermissions :: !Permissions -- ^ The permissions this role has in abstract of channels
    , roleManaged     :: !Bool -- ^ Whether or not this role is managed by an integration
    , roleMentionable :: !Bool -- ^ Whether or not this role is mentionable
    }

-- | Represents the set of permissions in a role or channel
newtype Permissions = Permissions Int
