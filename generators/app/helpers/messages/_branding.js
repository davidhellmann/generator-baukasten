const chalk = require('chalk')

const branding = (version, author, website, repoURL) => {
    return chalk`{magenta

                            888                        888                        888                                                
                            888                        888                        888                                                
                            888                        888                        888                                                
                            88888b.   8888b.  888  888 888  888  8888b.  .d8888b  888888 .d88b.  88888b.                             
                            888 "88b     "88b 888  888 888 .88P     "88b 88K      888   d8P  Y8b 888 "88b                            
                            888  888 .d888888 888  888 888888K  .d888888 "Y8888b. 888   88888888 888  888                            
                            888 d88P 888  888 Y88b 888 888 "88b 888  888      X88 Y88b. Y8b.     888  888                            
                            88888P"  "Y888888  "Y88888 888  888 "Y888888  88888P'  "Y888 "Y8888  888  888                         
                                                                                                        
            }{yellow                                                                
                                             • • • baukasten made with love & help • • •                     
                                                                                                   
            }{cyan
                            -----------------------------------------------------------------------------          
                                                                                                         
                            Version  :   ${version}
                            Author   :   ${author}                                                   
                            Website  :   ${website}                                         
                            Github   :   ${repoURL}          
                                                                                                         
                            -----------------------------------------------------------------------------          
                                                                                                         
                                                                                                         
                                                                                                         
                                                                                                         
                                                                                                         
            }`
}

module.exports = branding
