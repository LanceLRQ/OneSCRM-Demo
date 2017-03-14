module.exports = {
    account: {
        login: require('./account/login'),
        register: require('./account/register'),
        space: {
            enterprise_list: require('./account/space/enterprise_list')
        }
    },
    dashboard: {
        profile: {
            index: require('./dashboard/profile/index')
        },
        settings: {
            info: {
                view: require('./dashboard/settings/info').view,
                save: require('./dashboard/settings/info').save
            },
            store:{
                list: require('./dashboard/settings/store').list,
                new: require('./dashboard/settings/store').new,
                edit: require('./dashboard/settings/store').edit
            }
        },
        vip_member:{
            vipcard:{
                index: require('./dashboard/vip_member/vipcard').index,
                edit:require('./dashboard/vip_member/vipcard').edit,
                manage:require('./dashboard/vip_member/vipcard').manage,
            },
            vipmanage:{
                list:require('./dashboard/vip_member/vipmanage').list,
                details:require('./dashboard/vip_member/vipmanage').details,
            },
            vipmember:{
                edit:require('./dashboard/vip_member/vipmember').edit,
                recordsPay:require('./dashboard/vip_member/vipmember').recordsPay,
                recordsRech:require('./dashboard/vip_member/vipmember').recordsRech,
                recordsBuy:require('./dashboard/vip_member/vipmember').recordsBuy,
                recordsInte:require('./dashboard/vip_member/vipmember').recordsInte,
                recordsCancel:require('./dashboard/vip_member/vipmember').recordsCancel,
                recordsGift:require('./dashboard/vip_member/vipmember').recordsGift,
            },
            viplabel:{
                manage:require('./dashboard/vip_member/viplabel').manage,
                divide:require('./dashboard/vip_member/viplabel').divide,
                new:require('./dashboard/vip_member/viplabel').new,
            },
            viplevel:{
                type:require('./dashboard/vip_member/viplevel').type,
                settings:require('./dashboard/vip_member/viplevel').settings,
            }
        }
        
    }
    //
    // settings: require('./settings/settings'),
    // vip_member: require('./vip_member/vip_member')
};