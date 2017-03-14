module.exports = function *(next) {

    try {
        var msg = this.wechat.body;
        switch (msg.InfoType) {
            case "component_verify_ticket":
                console.log("[" + this.getSysTime() + "] Receive Component Verify Ticket: " + msg.ComponentVerifyTicket);
                this.wechat.component.verifyTicket = msg.ComponentVerifyTicket;
                this.wechat.component.save();
                this.body = "success";
                break;
        }
    }catch(ex){
        console.log(ex);
    }
};
