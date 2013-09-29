require(RCurl)
require(rjson)

myaccess_token<-"CAACEdEose0cBAO6zIbhIoqtzRQQBgvBZCeW7SKWxXH7liohby4V4Hz7DKG4qJCQIsAToVR8AYKraRBO46oUNIXyLEk3ZCmerOHr86yPThdetQ0ZABIZAgTGagUiwP00Ok2ZBGO39ErriZAU8C4Yt41R7q8yIID1AKS0iXsOJluLYmfGARoiW9nraWUNKeepDKxJjfFD9rkuwZDZD"

require(RCurl)
require(rjson)

facebook <-  function( path = "me", access_token = token, options){
    if( !missing(options) ){
        options <- sprintf( 
                           "?%s&", 
                           paste( 
                                 names(options), "=", unlist(options), 
                                 collapse = "&", sep = "" 
                                 ) 
                           )
    } else {
        options <- "?"
    }

    urlTemplate <- "https://graph.facebook.com/%s%saccess_token=%s"
    data <- getURL( 
                   sprintf( 
                           urlTemplate, 
                           path,
                           options,
                           access_token 
                           ) 
                    )
    fromJSON( data )
}
