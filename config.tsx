
import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")
    oni.input.bind(["<enter>", "<tab>"], "contextMenu.select");
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {

    "ui.colorscheme": "nord",

    "editor.fontSize": "16px",
    "editor.fontFamily": "Fira Code",

    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
}
