# fu == file upload
define ["msgbus", "marionette", "components/fu/show/controller"], (msgBus, Marionette, Controller) ->


    class Router extends Marionette.AppRouter
        appRoutes:
            "upload": "show"

    API =
        show: ->
            new Controller
                # custom attributes overriden for this instance 
                # one file max, must be a text/plain, run the ZDCashFlows process
                action: "none" # this is the process to be run after the file is uploaded/ default noOp is 'upload'
                mimeTypes: "text/plain"
                queueSizeLimit: 1
                fileDataName: "Filedata"
                handler: "/upload"

    msgBus.commands.setHandler "start:fu:app", ->
        new Router
            controller: API