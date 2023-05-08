
--░██╗░░░░░░░██╗███████╗██████╗░██╗░░██╗░█████╗░░█████╗░██╗░░██╗░██████╗
--░██║░░██╗░░██║██╔════╝██╔══██╗██║░░██║██╔══██╗██╔══██╗██║░██╔╝██╔════╝
--░╚██╗████╗██╔╝█████╗░░██████╦╝███████║██║░░██║██║░░██║█████═╝░╚█████╗░
--░░████╔═████║░██╔══╝░░██╔══██╗██╔══██║██║░░██║██║░░██║██╔═██╗░░╚═══██╗
--░░╚██╔╝░╚██╔╝░███████╗██████╦╝██║░░██║╚█████╔╝╚█████╔╝██║░╚██╗██████╔╝
--░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░

--- @param Important, add a webhook here, otherwise the images won't work.
Config.Webhook = 'https://discord.com/api/webhooks/1104274079579656253/dVIPNefL8gqOwoH31lcjyULpTuCxBSC65G4yfPgDn5j-blNDT4H8RxX5kdpQSJzFSk3y'             --- @param Set your own discord Webhook here.
Config.TwitterWebhook = 'https://discord.com/api/webhooks/1104274782045872189/qmco6ZhyvQ0qXhM6CvsKC95Ez_A-zdIF8shNPL2oSLMoX2idLLfycn4A_xbq4D9ETNQ_'      --- @param Set your own discord Webhook here.
Config.InstagramWebhook = 'https://discord.com/api/webhooks/1104274960056336445/CjmXpuJtUfyZidXkYcxePqFQcmXsnztA5pJ7alv4XDlSAUr1LO_T-9tP2CQpEBlrGpGX'    --- @param Set your own discord Webhook here.
Config.YellowPagesWebhook = 'https://discord.com/api/webhooks/1104275124150095932/qb4GXdAHTesahrd8pMtgE0h9xXEkSGaqj0RYbYTAsrJGfsOVnSQdopdzJOv62hxrlUUV'  --- @param Set your own discord Webhook here.
Config.NewsWebhook = 'https://discord.com/api/webhooks/1104275489729818634/2JbnI-U-mWGsZG79ZP1jmiavA5hiwWQF-IUECFhodHf0eUOPlXDryOJpGWUZUgRS4Lgn'         --- @param Set your own discord Webhook here.

-- Webhooks for social media posts, all of these can be public for your players to see the webhooks on your discord server!
Config.PublicWebhookFooter = 'Quasar Smartphone Logs'
Config.WebhookImage = 'https://media.discordapp.net/attachments/926274292373655562/999502096430796950/xd.png?width=676&height=676'

Config.Webhooks = { -- Enable or disable webhooks.
    twitter = true,
    instagram = true,
    yellowpages = true,
    news = true,
}

Config.WebhooksTranslations = { -- All webhook translations.
    ['twitter'] = {
        name = 'Twitter',
        title = 'New Tweet!',
        username = '**Username**: @',
        description = '\n**Description**: ',
        image = 'https://media.discordapp.net/attachments/926274292373655562/999492805770608710/twitter.png'
    },

    ['instagram'] = {
        name = 'Instagram',
        title = 'New Post!',
        username = '**Username**: @',
        description = '\n**Description**: ',
        image = 'https://media.discordapp.net/attachments/926274292373655562/999504825450500157/instagram.png'
    },

    ['yellowpages'] = {
        name = 'Yellow Pages',
        title = 'New Post!',
        username = '**Username**: ',
        description = '\n**Description**: ',
        number = '\n**Number**: ',
        image = 'https://media.discordapp.net/attachments/926274292373655562/999508700907700234/yellow_pages.png'
    },

    ['news'] = {
        name = 'News',
        title = 'New Storie!',
        storie = '**Title**: ',
        description = '\n**Description**: ',
        date = '\n**Number**: ',
        image = 'https://media.discordapp.net/attachments/989917195972788234/1002266182994362379/weazel.png'
    },
}