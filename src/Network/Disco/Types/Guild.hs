module Network.Disco.Types.Guild
    ( Guild(..)
    , VerificationLevel
    )
where

import           Data.Text                  (Text)

import           Network.Disco.Types.Common
import           Network.Disco.Types.Voice


-- | Used to tag snowflakes with a flat guild type
data GuildType = GuildType

-- | Represents a guild, or server in discord.
data Guild a = Guild
    { guildID                   :: !(Snowflake GuildType) -- ^ The ID of the guild
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
    , guildExplicitFilter       :: !ExplicitContentFilter
    , guildRoles                :: ![Role] -- ^ A list of roles in the guild
    , guildEmojis               :: ![Emoji]  -- ^ A list of custom emojis in this guild
    , guildFeatures             :: ![Text] -- ^ A list of enabled guild features
    , guildMFA                  :: !MFALevel -- ^ The required MFA level for the guild
    , guildApplicationID        :: !(Maybe (Snowflake User)) -- ^ The application id of the guild creator if it was bot created
    , guildWidgetEnabled        :: !Bool -- ^ Whether or not the server widget is enabled
    , guildWidgetChannelID      :: !(Snowflake Channel) -- ^ The channel ID for the server widget
    , guildSystemChannelID      :: !(Maybe (Snowflake Channel)) -- ^ The ID of the channel where system messages are sent
    , guildExtra                :: a -- ^ Represents extra content in the guild only present if coming from the cache
    }

-- | Represents the extra info in a guild coming from the cache
data GuildExtra = GuildExtra
    { guildJoinedAt    :: !Text -- ^ When this guild was joined at
    , guildLarge       :: !Bool -- ^ Whether this guild is considered large or not
    , guildUnavailable :: !Bool -- ^ Whether or not this guild is unavailable
    , guildMemberCount :: !Int -- ^ The total number of members in guild
    , guildVoiceStates :: ![VoiceState ()] -- ^ An array of voice states without a guild id field
    , guildMembers     :: ![GuildMember]
    , guildChannels    :: ![Channel]
    }


-- | Represents a user in a guild
data GuildMember = GuildMember
    { gmUser     :: User -- ^ The user behind this guild member
    , gmNick     :: !(Maybe Text)  -- ^ The nickname this guild member has
    , gmRoles    :: ![Snowflake Role] -- ^ An array of roles the member has
    , gmJoinedAt :: !Text -- ^ When the user joined the guild
    , gmDeaf     :: !Bool -- ^ Whether or not the user is deafened
    , gmMute     :: !Bool -- ^ Whether or not the user is muted
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


-- | Represents the level of multi factor authentication
data MFALevel
    = NoMFA
    | ElevatedMFA


-- | Represents a role in a guild
data Role = Role
    { roleID          :: !(Snowflake Role) -- ^ The ID of this role
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


-- | Represents a custom emoji in a guild
data Emoji = Emoji
    { emojiID            :: !(Snowflake Emoji) -- ^ The custom ID of this emoji
    , emojiName          :: !Text -- ^ The name of this emoji
    , emojiRoles         :: ![Snowflake Role] -- ^ The roles this emoji is whitelisted to
    , emojiUser          :: !(Maybe User) -- ^ The user that created this emoji
    , emojiRequireColons :: !Bool -- ^ Whether or not this emoji must be wrapped in colons
    , emojiManaged       :: !Bool -- ^ Whether or not this emoji is managed
    }
